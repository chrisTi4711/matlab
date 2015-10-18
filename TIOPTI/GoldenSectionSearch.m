f = @(x) x.^4 - 14*x.^3 + 60*x.^2 - 70*x;

% start range:
a0 = 0;
b0 = 2;

% stop at this accuracy (b-a):
accuracy = 0.3;

% otherwise stop after this number of function evalutions:
max_func_evals = 20;

[a,b] = gss(f,a0,b0,accuracy,max_func_evals);
final_range = [a,b]
final_accuracy = b - a