function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
  N = length(X);
  x_mean = mean(X, 1);
  X = bsxfun(@minus, X, x_mean);
  
  covar_m = 1/(N-1) * (X' * X);
  [EVecs, EVals] = eig(covar_m);
  EVals = diag(EVals);
  [tmp, ridx] = sort(EVals, 1, 'descend');
  EVals = EVals(ridx);
  EVecs = EVecs(:, ridx);
    
    
    %EVecs = nan;
    %EVals = nan;

end

