clc
% Calculate the gradient and the hessian matrix of a function.

syms x1 x2
f = 5*x1 + 8*x2 + x1*x2 - x1^2 - 2*x2^2;

grad = gradient(f, [x1, x2])
hess = hessian (f, [x1, x2])
