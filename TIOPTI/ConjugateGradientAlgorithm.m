

Q = [2 -2;-2 6];
b = [0;-3];

%1
x = [1;1];

%2
g = Q*x-b
if all(g == 0); return; end
d = -g;

for k=0:3
    %3
    alpha = -(g'*d)/(d'*Q*d)
    
    %4
    xx = x + alpha*d
    
    %5
    gg = Q*xx-b
    if all(gg == 0); return; end
    d = -g;
    
    %6
    beta = (gg'*Q*d)/(d'*Q*d)
    
    %7
    dd = -gg + beta*d
    
    g = gg;
    x = xx;
    d = dd;
end

