function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

K = 10;
D = size(Xtrain, 2);

Ms = zeros(K, D);
Covs = zeros(K, D, D);

for i = 1:K
    Ms(i, :) = MyMean(Xtrain(find(Ytrain == i-1),:));
    Covs(i, :, :) = MyCov(Xtrain(find(Ytrain == i-1), :));
    Covs(i,:,:) = reshape(Covs(i,:,:), [D,D]) + (epsilon .* eye(D));
end
   
  
for i = 1:K
    mu = Ms(i, :);
    o = reshape(Covs(i,:,:), [D,D]);
    difference = Xtest - repmat(mu, size(Xtest, 1), 1);
    log_postp(:, i) = -0.5 * sum(((difference*inv(o)).*difference), 2) -0.5 * logdet(o) + log(size(Xtrain(Ytrain==i-1,:), 1))/size(Xtrain, 1);

end

for i = 1:size(log_postp,1)
      [~, I] = max(log_postp(i,:));
      Ypreds(i) = I-1;
end


end
