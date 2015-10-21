clear; clc;

f = @(x) x.^4-8*x.^2+x; % W shape; left is global minimum, right is local minumum

x = 3;
N = 1; % width of neighborhood

for k=0:1000
    a = x-0.5*N;
    b = x+0.5*N;
    z = (b-a).*rand(1,1) + a;
    
    if f(z) < f(x)
        x = z;
        f(x)
    end
end

x