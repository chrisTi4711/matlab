clear;clc;

Q = [2 -2;-2 6];
b = [0;-3];
x = [1;1]; % starting point

%2
g = Q*x-b;
fprintf('g(0) = \n');disp(g);

if all(g == 0); return; end
d = -g;
fprintf('d(0) = \n');disp(d);

for k=0:3
    fprintf('Iteration %i: ---------------------\n',k+1);
    %3
    alpha = -(g'*d)/(d'*Q*d);
    fprintf('alpha_%i = \n',k);disp(alpha);
    
    %4
    xx = x + alpha*d;
    fprintf('x(%i) = \n',k+1);disp(xx);
    
    %5
    gg = Q*xx-b;
    fprintf('g(%i) = \n',k+1);disp(gg);
    if all(gg == 0); return; end
    
    %6
    beta = (gg'*Q*d)/(d'*Q*d);
    fprintf('beta_%i = \n',k);disp(beta);
    
    %7
    dd = -gg + beta*d;
    fprintf('d(%i) = \n',k+1);disp(dd);
    
    g = gg;
    x = xx;
    d = dd;
end

