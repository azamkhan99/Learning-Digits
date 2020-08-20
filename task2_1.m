%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain


knn = tic;
Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
timeElapsed = toc(knn);
timeElapsed;
disp(timeElapsed);

for i = 1:size(Ks, 2)
    k = Ks(i);
    [CM, acc] = comp_confmat(Ytest, Ypreds(:,i), 10);
    N = size(Ytest, 1);
    Nerrs = (1 - acc) * N;
    
    T = table(k, N, Nerrs, acc);
    disp(T);
    
    
    baseMatFileNameC= sprintf('task2_1_cm%d.mat', k);
    
    save(baseMatFileNameC, 'CM');



end
