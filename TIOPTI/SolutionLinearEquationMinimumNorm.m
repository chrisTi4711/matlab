clc; clear;

A = [1 2 -1;4 1 3];
b = [1 0]';

if size(A,1) > size(A,2)    
    fprintf('A has more rows than columns!!\n')
    return
end

if size(A,1) ~= size(b)    
    fprintf('b has more rows than A!!\n')
    return
end

if rank(A) ~= size(A,1)    
    fprintf('A has more rows than rank of A\n')
    return
end

fprintf('Point closest to the origin of R^%i on the intersections of the lines/planes/..', size(A,2))
x = A'*(A*A')^(-1)*b