clc; clear;

A = [3 2; 1 1];
b = [5 2]';
xcomp = [1.1 0.88]';

x = A\b;

e = x - xcomp
absolute_error = norm(e, inf)
relative_error = norm(e, inf) / norm(x, inf)

r = b - A*xcomp
relative_residual = norm(r, inf) / norm(b, inf)

condA = norm(A, inf) * norm(A^-1, inf)

fprintf('relative error bounds:\n')
lower = 1/condA*relative_residual;
upper =   condA*relative_residual;
fprintf('   %f <= %f <= %f\n', lower, relative_error, upper);

x_min = (A'*A)^(-1)*A'*b