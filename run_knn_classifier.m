function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

DI = vect_dist(Xtrain, Xtest);
[std, idx] = sort(DI, 1);
Ypreds = zeros(size(Xtest, 1), size(Ks, 2));

%for i = 1: size(std, 1)
for i =1:size(Xtest,1)
    for j = 1:size(Ks, 2)
        k = Ks(j);
        Ypreds(i, j) = mode(Ytrain(idx((1:k),i)));
    end
end


end
