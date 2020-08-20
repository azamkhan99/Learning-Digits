%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
Img = zeros(28, 308);
YX = [Y X];
M = zeros(11, size(X,2));
M(end, :) = MyMean(YX(:, 2: end));
for i = 0:9
    M(i+1, :) = MyMean(YX(YX(:,1) == i, 2:end));
    Img(:, i*28+1:i*28+28) = reshape(M(i+1,:),28,28)';
end
Img(:, 10*28+1:end) = reshape(M(11,:), 28, 28)'
figure
montage(Img);





end
