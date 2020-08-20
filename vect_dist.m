function v_dist = vect_dist(X, Y)

X = X';
Y = Y';
v_dist = bsxfun(@plus,dot(X,X,1)',dot(Y,Y,1))-2.*(X'*Y);

end
