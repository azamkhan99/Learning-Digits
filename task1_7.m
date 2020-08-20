%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
load(MAT_ClusterCentres, 'C');
load(MAT_M, 'M');
load(MAT_evecs, 'EVecs');
load(MAT_evals, 'EVals');

Dmap = zeros(nbins);
pca1 = EVecs(:, 1);
pca2 = EVecs(:, 2);


ox = std(C * pca1);
oy = std(C * pca2);

cprx = C * pca1;
cpry = C * pca2;

cpr = [cprx cpry];

mux = (M(11,:) - posVec) * pca1;
muy = (M(11,:) - posVec) * pca2;

rangexmx = mux + (5*ox);
rangeymx = muy + (5*oy);
rangeymn = muy - (5*oy);
rangexmn = mux - (5*ox);

Knn = 1;

Xplot = linspace(rangexmn, rangexmx, nbins)';
Yplot = linspace(rangeymn, rangeymx, nbins)';
% Obtain the grid vectors for the two dimensions
[Xv Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
classes = length(Xv(:));
for i = 1:length(gridX)  % Apply k-NN for each test point
    
    dists = square_dist(cpr, gridX(i, :))'; % Compute distances
    [d I] = sort(dists, 'ascend');
    
    %shouldn't be C here 
    classes(i) = min((I(1:Knn)));
end



figure;

% This function will draw the decision boundaries
[CC,h] = contourf(Xplot(:), Yplot(:), reshape(classes, length(Xplot), length(Yplot)));
set(h,'LineColor','none');

Dmap = reshape(classes, length(Xplot), length(Yplot));
save(['task1_7_dmap_' num2str(size(C, 1))], 'Dmap');


end







