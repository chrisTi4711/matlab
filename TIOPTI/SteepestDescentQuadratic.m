clear; clc;

x = [1 1]'; % starting value
Q = [2 -2; -2 6];
b = [0 -3]';

epsilon_x = 1e-5; %accuracy

for k=1:50 
    fprintf('x(%i) = \n', k);
    g = Q*x - b;
    alpha = (g'*g)/(g'*Q*g);
    x_new = x - alpha*g;
    disp(x_new);
    
    e = norm(x_new-x)/norm(x);
    if(e <= epsilon_x)
        break;
    end
    
    x = x_new;
end