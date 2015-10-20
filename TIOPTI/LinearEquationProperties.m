clc; clear;

A = [3 2; 1 1];
b = [5 2]';
xcomp = [1.1 0.88]';

x = A\b %same as: (A'*A)^(-1)*A'*b

e = x - xcomp
absolute_error = norm(e, inf)
relative_error = norm(e, inf) / norm(x, inf)

r = b - A*xcomp
relative_residual = norm(r, inf) / norm(b, inf)

condA = norm(A, inf) * norm(A^-1, inf)

fprintf('relative error bounds:\n')
lower = 1/condA*relative_residual;
upper =   condA*relative_residual;
fprintf('   %f <= %f <= %f\n\n', lower, relative_error, upper);

gradient = 2*(A'*A*x)-2*A'*b
if ~any(gradient)    
    fprintf('-> FONC: fulfilled\n\n')
else
    fprintf('-> FONC: NOT fulfilled\n\n')
end

fprintf('  rank A < rank [A,b]\n');
fprintf('%f < %f\n', rank(A), rank([A,b]));
if rank(A) ~= rank([A,b])    
    fprintf('-> b does not belong to the range of A\n')
    fprintf('   Thus the system of equations is inconsistent!\n\n')
end

