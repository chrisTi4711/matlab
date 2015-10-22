clear;clc

Q = [6 4;4 6];

% syms x1 x2
% f = 3*(x1.^2+x2.^2)+4*x1*x2+5*x1+6*x2+7
% Q = eval(hessian(f))

fprintf('Eigenvalues of Q:\n')
disp(eig(Q));

fprintf('Convergence of fixed-step-size gradient algorithm only if:\n')
max_alpha = 2/max(eig(Q));
fprintf('    0 < alpha < %f\n\n',max_alpha);

fprintf('Condition number (r) of Q:\n')
r = norm(Q)*norm(inv(Q));
disp(r);

fprintf('Rate of convergence:\n')
tmp = 1-1/r;
fprintf('    V(x(k+1)) <= %f * V(x(k))\n\n',tmp);