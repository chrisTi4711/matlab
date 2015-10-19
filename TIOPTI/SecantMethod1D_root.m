clear, close all;

g = @(x) (2*x-1).^2 + 4*(4-1024*x).^4

x_old = 0;
x_curr = 1;
accuracy = 1e-5;

fprintf('k  x  \n'); 
for k=1:20
    x_new = x_curr - ((x_curr - x_old)./(g(x_curr)-g(x_old))).*g(x_curr);
    e = abs(x_curr-x_new);
    fprintf('%d: %f\n', k, x_new); 
    if (abs(x_curr-x_new) < x_new*accuracy)
        break
    end
    x_old = x_curr;
    x_curr = x_new;
end