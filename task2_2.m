%
%
function Dmap = task2_2(X, Y, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

%load(MAT_ClusterCentres, 'C');
%load(MAT_M, 'M');

load(MAT_evecs, 'EVecs');
load(MAT_evals, 'EVals');


Dmap = zeros(nbins);
pca1 = EVecs(:, 1);
pca2 = EVecs(:, 2);
PCA = [pca1 pca2];


ox = std(X * pca1);
oy = std(X * pca2);

cprx = X * pca1;
cpry = X * pca2;

cpr = [cprx cpry];

m = (MyMean(X));

mux = (m - posVec) * pca1;
muy = (m - posVec) * pca2;

rangexmx = mux + (5*ox);
rangeymx = muy + (5*oy);
rangeymn = muy - (5*oy);
rangexmn = mux - (5*ox);



Xplot = linspace(rangexmn, rangexmx, nbins);
Yplot = linspace(rangeymn, rangeymx, nbins);
% Obtain the grid vectors for the two dimensions
[Xv, Yv] = meshgrid(Xplot, Yplot);

gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.


grid2 = gridX * PCA';

preds = run_knn_classifier(X, Y, grid2, k);
Dmap = reshape(preds, nbins, nbins);


%figure;
% This function will draw the decision boundaries
[CC,h] = contourf(Xplot(:), Yplot(:), Dmap);
set(h,'LineColor','none');



end
