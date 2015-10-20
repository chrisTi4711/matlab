clear; clc; close all

syms x1 x2

f = x1.^2+3.*x2.^2-2.*x1.*x2+3.*x2;

[x1, x2] = meshgrid(-10:.2:10,-10:.2:10);

figure(1)
[C,h] = contour(x1, x2, eval(f), [0,5,10,25,75,100,250]);
clabel(C,h);
xlabel('x1');
ylabel('x2');
hold on;

% point where gradient should be drawn:
x1 = 1;
x2 = 1;

g = eval(gradient(f))
gl = [x1, x2, g'];
lh = quiver(gl(1),gl(2),gl(3),gl(4));
set(lh,'linewidth',2);
set(lh,'color',[1,0,0]);


