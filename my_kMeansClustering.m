%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  %% TO-DO
%[N dim] = size(X);
D = zeros(k, size(X, 1));
idx_prev = zeros(1, size(X,1));
SSE = zeros(maxIter+1, 1);
C = initialCentres;
 
for i = 1:maxIter
    %i
    %for c = 1:k
        D = vect_dist(X, C);
    %end
    [mince, idx] = min(D, [], 2);
    
    SSE(i) = sum(mince);
    
    
    for c = 1:k
        if (sum(idx == c) == 0)
            warning("k-means: cluster %d is empty", c);
        else
            C(c, :) = mean(X(idx==c,:));
        end 
    end
   
    
%dont know  
% This is the cutoff-code need to add extra info in the break off to set
% graph straight
     if(idx == idx_prev)
         SSE(i:maxIter+1) = repmat(SSE(i),maxIter+2-i,1);
         break;
     end
    
    idx_prev = idx;
    
end

  SSE(maxIter+1) = sum(mince);
    
  plot(1:maxIter+1,SSE);


  
end
