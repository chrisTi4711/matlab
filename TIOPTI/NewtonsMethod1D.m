clear, close all;

syms x;

f = 0.5.*x.^2-sin(x)
ff = diff(f)
fff = diff(ff)

x = 0.35;
accuracy = 1e-5;

fprintf('k  x        e\n'); 
for k=1:20
    xx = x - eval(ff)./eval(fff);
    e = abs(x-xx);
    fprintf('%d: %f %.4e\n', k, xx, e); 
    if (e < accuracy)
        break
    end
    x = xx;
end