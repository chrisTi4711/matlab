clear; clc;

f = @(x) x.^4-8*x.^2+x; % W shape; left is global minimum, right is local minumum

x = 3;
alpha = 0.5; % width of neighborhood (zk - alpha <= xk <= zk + alpha)
gamma = 100;
xbest = x;

for k=0:1000
    d = 2.*alpha.*rand(1,1)-alpha;
    z = x+d;

    cointoss = rand(1);
    T = gamma/log(k+2);
    p = exp(-(f(z)-f(x))/T);
    
    if f(z) < f(x) || cointoss < p
        x = z;
    end
    
    if f(x) < f(xbest)
        xbest = x;
        f(xbest)
    end
end

xbest