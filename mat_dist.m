function m_dist = mat_dist(X, Y)
% Compute square distances between 2 matrix of samples
% Inputs:
%   Xtrn: M-by-D matrix of M samples, each of dimension D
%   Xtst: N-by-D matrix of N samples, each of dimension D
% Ouptut:
%   DI: N-by-M euclidean square-distance matrix, where DI(i,j) is the distance
%       between sample Xtst(i,:) and sample Xtrn(j,:)

M = size(X, 1);          % number of training samples
N = size(Y, 1);          % number of test samples

% Compute the squared distance, using vectorisation
XX = sum(Y .^ 2, 2);
YY = sum(X .^ 2, 2);
m_dist = repmat(XX, 1, M) - 2 * Y * X' + repmat(YY, 1, N)'; 

end