clc; clear;

f = @(x) 8.*exp(1-x)+7.*log(x);

left = 1;
right = 2;
uncert = 0.23;

rho = (3-sqrt(5))/2;

N = log(uncert/(right-left))/log(1-rho)
N = ceil(N)

lower='a';
a=left+(1-rho)*(right-left);
f_a=f(a);

fprintf('-------------------------------------------------------------------------------------\n');
fprintf('k     a           b           f(a)        f(b)   lower    New uncertainity interval  \n');
fprintf('-------------------------------------------------------------------------------------\n');

for i=1:N
    if lower=='a'
        b=a;
        f_b=f_a;
        a=left+rho*(right-left);
        f_a=f(a);
    else
        a=b;
        f_a=f_b;
        b=left+(1-rho)*(right-left);
        f_b=f(b);
    end
    
    if f_a<f_b
        right=b;
        lower='a';
    else
        left=a;
        lower='b';
    end
    
    New_Interval = [left,right];
    
    fprintf('%i: %f    %f    %f    %f    %c        [%f %f] \n', i, a, b, f_a, f_b, lower, left, right);
end

fprintf('\nfinal accuracy after %i iterations:\n   %f < %f\n', N, right - left, uncert);