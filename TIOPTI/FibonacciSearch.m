clc; clear;

f = @(x) 8.*exp(1-x)+7.*log(x);

left = 1;
right = 2;
uncert = 0.23;
epsilon = 0.05;

F(1)=1;
F(2)=1;

N=0;
while F(N+2) < (1+2*epsilon)*(right-left)/uncert
    F(N+3)=F(N+2)+F(N+1);
    N=N+1;
end

N %print N

lower='a';
a=left+(F(N+1)/F(N+2))*(right-left);
f_a=f(a);

fprintf('-------------------------------------------------------------------------------------\n');
fprintf('k    rho         a           b           f(a)        f(b)   lower    New uncertainity interval  \n');
fprintf('-------------------------------------------------------------------------------------\n');

for i=1:N
    if i~=N
        rho=1-F(N+2-i)/F(N+3-i);
    else
        rho=0.5-epsilon;
    end
    
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
    
    fprintf('%i: %f   %f    %f    %f    %f    %c        [%f %f] \n', i, rho, a, b, f_a, f_b, lower, left, right);
end

fprintf('\nfinal accuracy after %i iterations:\n   %f < %f\n', N, right - left, uncert);