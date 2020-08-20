%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

[EVecs, EVals] = comp_pca(X);

pca1 = EVecs(:, 1);
pca2 = EVecs(:, 2);

cprx = X * pca1;
cpry = X * pca2;

cpr = [cprx cpry];

mu = zeros(10, size(cpr,2));
Sigmas = zeros(2,2,10);


for i = 0:9
    Sigmas(:, :, i+1) = cov(cpr(Y(:,1) == i,:));
    mu(i+1, :) = MyMean(cpr(Y(:,1) == i,:));
    [V, D] = eig(Sigmas(:, :, i+1));
    
    t = linspace(0, 2 * pi);
    a = (V * sqrt(D)) * [cos(t(:))'; sin(t(:))'];
    plot(a(1, :) + mu(i+1, 1), a(2, :) + mu(i+1, 2));
    %previous three lines are from https://www.xarg.org/2018/04/how-to-plot-a-covariance-error-ellipse/
    
    text(mu(i+1, 1), mu(i+1, 2), num2str(i));
    hold on;     
end


end
