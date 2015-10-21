clear; clc;

f = @(x) x.^4-8*x.^2+x; % W shape; left is global minimum, right is local minumum

x = 3;
alpha = 0.5; % width of neighborhood (zk - alpha <= xk <= zk + alpha)

for k=0:1000
    d = 2.*alpha.*rand(1,1)-alpha;
    z = x+d;
    
    if f(z) < f(x)
        x = z;
        f(x)
    end
end

x