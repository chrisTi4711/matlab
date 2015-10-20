clc; clear;

A = [1 1;2 1;3 1;4 1;5 1];
b = [1 1.5 2.75 2 3]';
xcomp = [1.1 0.88]';

x = A\b %same as: (A'*A)^(-1)*A'*b

fprintf('rank A < rank [A,b]\n');
fprintf('%f < %f\n', rank(A), rank([A,b]));
if rank(A) ~= rank([A,b])    
    fprintf('-> b does not belong to the range of A\n')
    fprintf('   Thus the system of equations is inconsistent!\n')
    
    e = A*x-b
else
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
end



