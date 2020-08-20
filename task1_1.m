%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
img = zeros(28,28,1,10);

i = 9;
n = 1;
x = 1;
while x <= 10
    if Y(n) ~= i
        n = n + 1;
    else 
        img(:,:,1,x) = ( reshape(X(n,:), 28, 28)' );
        n = n + 1;
        x = x + 1;
    end
end
montage(img, 'Size', [1 10]);


end
