clear;clc;

Q = [5 2;2 1];
b = [3;1];
x = [0;0]; % starting point

%2
g = Q*x-b;
fprintf('g(0) = \n');disp(g);

if all(g == 0); return; end

fprintf('Iteration %i: ---------------------\n',1);
d = -g;
fprintf('d(0) = -g(0) = \n');disp(d);

for k=0:3
    %3
    alpha = -(g'*d)/(d'*Q*d);
    fprintf('alpha_%i = \n',k);disp(alpha);
    
    %4
    xx = x + alpha*d;
    fprintf('x(%i) = \n',k+1);disp(xx);
    
    %5
    gg = Q*xx-b;    
    if all(gg == 0); return; end
    fprintf('g(%i) = \n',k+1);disp(gg);
    
    %6
    fprintf('Iteration %i: ---------------------\n',k+2);
    beta = (gg'*Q*d)/(d'*Q*d);
    fprintf('beta_%i = \n',k);disp(beta);
    
    %7
    dd = -gg + beta*d;
    fprintf('d(%i) = \n',k+1);disp(dd);
    
    g = gg;
    x = xx;
    d = dd;
end

