function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class



mgcs = tic;
[Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
timeElapsed = toc(mgcs);


[CM, acc] = comp_confmat(Ytest, Ypreds, 10);

N = size(Xtest, 1);
Nerrs = (1 - acc) * N;
T = table(N, Nerrs, acc, timeElapsed);
disp(T);
    
m1 = MMs(1:L,:);
cov1 = MCovs(1:L,:,:);

save(sprintf('task2_8_cm_%d.mat',L),'CM');
save(sprintf('task2_8_g%d_m1.mat',L),'m1');
save(sprintf('task2_8_g%d_cov1.mat',L),'cov1');


end
