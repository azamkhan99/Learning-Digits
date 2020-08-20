function Covs = MyCov(X)
L = size(X, 1);
diff = X - repmat(MyMean(X), L, 1);
Covs = diff' * diff/L;

end