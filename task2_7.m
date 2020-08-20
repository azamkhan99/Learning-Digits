%
%
function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  ratio  : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate

[r, c] = size(Xtrain);
lastRow = int32(ratio * r);
Xratio = Xtrain(1:lastRow,:);
Yratio = Ytrain(1:lastRow,:);


[Ypreds, Ms, Covs] = run_gaussian_classifiers(Xratio, Yratio, Xtest, epsilon);

[CM, acc] = comp_confmat(Ytest, Ypreds, 10);

baseMatFileNameC= sprintf('task2_7_cm_%d.mat', ratio*100);
save(baseMatFileNameC, 'CM');

acc * 100.0

end
