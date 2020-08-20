%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

[EVecs, EVals] = comp_pca(X);
CumVar = cumsum(EVals);
TotalVar = CumVar(end);

MinDims = [find(CumVar>0.7*TotalVar,1), find(CumVar>0.8*TotalVar,1), find(CumVar>0.9*TotalVar,1),find(CumVar>0.95*TotalVar,1)]
x = (1:10:784);
plot(x, CumVar(x));
xlabel("# of principal components");
ylabel("Cumulative Variance");

end
