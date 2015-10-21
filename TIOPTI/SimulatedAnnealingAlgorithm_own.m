clear; clc;

f = @(x) x.^4-8*x.^2+x; % W shape; left is global minimum, right is local minumum

x = 3;
N = 1; % width of neighborhood
gamma = 100;
xbest = x;

for k=0:1000
    a = x-0.5*N;
    b = x+0.5*N;
    z = (b-a).*rand(1,1) + a;

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