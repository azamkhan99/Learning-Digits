%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

[EVecs, EVals] = comp_pca(Xtrain);

pca1 = EVecs(:, 1);
pca2 = EVecs(:, 2);

cprx = Xtrain * pca1;
cpry = Xtrain * pca2;

cpr = [cprx cpry];

Corrs = zeros(11, 1);
l = zeros(2,2);

k = zeros(2,2);
k = corrcoef(cpr);
Corrs(end, :) = k(1,2);
for i = 0:9
    l = corrcoef(cpr(Ytrain(:,1) == i,:));
    Corrs(i+1, :) = l(1,2);

end

end