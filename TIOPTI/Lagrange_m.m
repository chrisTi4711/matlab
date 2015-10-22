clear; clc;

syms x1 x2 x3
f = x1.^2 + 2*x1*x2 + 3*x2.^2 + 4*x1 + 5*x2 + 6*x3;
h = [1 2 0;4 0 5]*[x1;x2;x3]-[3;6];

% FONC
syms v1 v2
l=f+[v1 v2]*h;
Dl = jacobian(l);
LagrangeFONC = Dl == 0

[x1s,x2s,x3s,v1s,v2s] = solve(LagrangeFONC,[x1 x2 x3 v1 v2]);
x = [x1s x2s x3s]'
v = [v1s v2s]'

% SOSC
F = hessian(f,[x1,x2,x3]);
vH = zeros(size(F));
for i=1:length(v)
    vH = vH + v(i)*hessian(h(i),[x1,x2,x3]);
end
L = F+vH

syms y1 y2 y3 alpha
Dh = jacobian(h)
T = Dh*[y1;y2;y3] == 0;
nn = [y1;y2;y3] ~= [0;0;0];
[y1s,y2s,y3s] = solve([T nn],[y1 y2 y3]);
y = alpha*[y1s,y2s,y3s]'

yLy = y'*L*y

