Q = [2 -2; -2 6];

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