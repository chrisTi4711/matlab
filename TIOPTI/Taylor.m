clear;clc;

syms x1 x2
f=x1^4 + 2*x1^2*x2^2 + x2^4

x0 = [1;1];
x1 = x0(1);
x2 = x0(2);

Df = jacobian(f)
D2f = hessian(f)

fx0 = eval(f)
Dfx0 = eval(Df)
D2fx0 = eval(D2f)

syms x1 x2
ft = fx0 + 1/factorial(1) * Dfx0*([x1;x2]-x0)...
         + 1/factorial(2) * ([x1';x2']-x0)' * D2fx0*([x1;x2]-x0)


