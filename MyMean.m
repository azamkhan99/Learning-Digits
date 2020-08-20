function mu = MyMean(X)
[I, J] = size(X);
mu = zeros(1, J); % allocate space for answer
for i = 1:I
    for j = 1:J
        mu(j) = mu(j) + X(i,j);
    end
end
mu=mu/I