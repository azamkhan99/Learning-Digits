function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)

[M D] = size(Xtrain);
MMs = zeros(L*10, size(Xtrain, 2));
MCovs = zeros(L*10, size(Xtrain, 2), size(Xtrain, 2));
 
trdata = zeros(M,1);
    
   
for i = 0:9
    points = Xtrain(Ytrain==i,:);
    [CC, idx, SSE] = my_kMeansClustering(points, L, points(1:L,:));
      
    trdata(Ytrain == i,:) = i + (idx - 1) * 10;
end  
    
   
   [Ypreds, MMs, MCovs] = run_gaussian_classifiers(Xtrain, trdata, Xtest, epsilon);
    Ypreds = mod(Ypreds, 10);
end
