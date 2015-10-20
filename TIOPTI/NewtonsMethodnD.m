clear, close all;

syms x1 x2 x3 x4;

f = (x1+10*x2).^2+5*(x3-x4)^2+(x2-2*x3).^4+10*(x1-x4).^4
g = gradient(f, [x1 x2 x3 x4])
F = hessian(f, [x1 x2 x3 x4])

% initial value:
x1 = 3;
x2 = -1;
x3 = 0;
x4 = 1;

accuracy = 1e-5;

for k=1:5
    fprintf('Iteration %i:\n', k); 
    
    gk = eval(g);
    Fk = eval(F);
    xk = [x1, x2, x3, x4]' - Fk\gk; % same as inv(Fk)*gk
    
    disp(xk');
    
    x1 = xk(1);
    x2 = xk(2);
    x3 = xk(3);
    x4 = xk(4);
end