clear; clc; close all;

syms x
y = 1/3*x.^3-7*x;
x = -10:.01:10;

figure;
plot(x,eval(y));
xlabel('x');
ylabel('f(x)');