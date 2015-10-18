clc
% 1. Calculate the gradient and the hessian matrix of a function.
% 2. Check FONC for specific point x.

syms x1 x2
f = x1^2 + 3*x2^2 - 2*x1*x2 + 3*x2 

grad = gradient(f, [x1, x2])
hess = hessian (f, [x1, x2])

x = [-.75;-.75] % point to check 

x1 = x(1);
x2 = x(2);
grad_at_x = eval(grad)

FONC = ~any(grad_at_x);
if(FONC)
    disp('-> FONC fulfilled!');
    
    eigenvalues = eval(eig(hess))
    SONC = FONC & all(eigenvalues > 0);
    if(SONC)
        disp('-> SONC fulfilled!');
    else
        disp('-> SONC not fulfilled!');
    end
else
    disp('-> FONC not fulfilled!');
end

