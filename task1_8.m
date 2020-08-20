%
%
function task1_8(X, k)
%  NB: there is no specification to this function.

load('task1_2_M.mat','M'); 
load('task1_3_evals.mat', 'EVals');
load('task1_3_evecs.mat', 'EVecs');

%%
%%First k vectors of training data

%[C, idx, SSE] = my_kMeansClustering(X, k, X(1:k,:), 250);
%save('task1_8_c_10_kratio.mat','C');
%save('task1_8_sse_10_kratio.mat','SSE');


%%
%%Randomly generated vectors

%[C,idx,SSE] =  my_kMeansClustering(X,k,rand(10,size(X, 2)), 250);
%save('task1_8_c_10_rand.mat','C');
%save('task1_8_sse_10_rand.mat','SSE');


%%
%%Mean vectors of each class

%[C,idx,SSE] =  my_kMeansClustering(X,k,M(1:k,:), 250);
%save('task1_8_c_10_meanVec.mat','C');
%save('task1_8_sse_10_meanVec.mat','SSE');


%%
%%First 10 eigenvectors

%eCentres = EVecs(:, 1:10)';
%[C,idx,SSE] =  my_kMeansClustering(X,k,eCentres, 50);
%save('task1_8_c_10_EVec.mat','C');
%save('task1_8_sse_10_EVec.mat','SSE');



%%
plot(1:51,SSE);
xlabel("Iteration number");
ylabel("SSE");




end
