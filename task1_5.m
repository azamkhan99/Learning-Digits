%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

for i = 1:size(Ks, 2)
    k = Ks(i);
    initialCentres = X(1:k,:);
    tic;
    [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres);
    t = toc
    plot(1:501,SSE);
    xlabel("Iteration number");
    ylabel("SSE");
    hold on;
   
    baseMatFileNameC= sprintf('task1_5_c_%d.mat', k);
    baseMatFileNameIDX= sprintf('task1_5_idx_%d.mat', k);
    baseMatFileNameSSE= sprintf('task1_5_sse_%d.mat', k);
    
    save(baseMatFileNameC, 'C');
    save(baseMatFileNameIDX, 'idx');
    save(baseMatFileNameSSE, 'SSE');
    
   
end

%plot(SSE);
     


end
