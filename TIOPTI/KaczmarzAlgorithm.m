clc; clear;

A = [1 2 -1;4 1 3];
b = [1 0]';

x = [0 0 0]';
u = 1; % 0 < u < 2

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

m = size(A,1);

for i = 0:1000
    for j = 1:m
       aj = A(j,:)';
       bj = b(j);
       x = x+u*(bj-aj'*x)*aj/(aj'*aj)
   end
end