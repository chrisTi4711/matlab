clear, close all;

syms x;

g = x.^3-12.2*x.^2+7.45*x+42
gg = diff(g)

x = 12;
accuracy = 1e-5;

fprintf('k  x        e\n'); 
for k=1:20
    xx = x - eval(g)./eval(gg);
    e = abs(x-xx);
    fprintf('%d: %f %.4e\n', k, xx, e); 
    if (e < accuracy)
        break
    end
    x = xx;
end