x = 1:.01:2;
y = x.^2+4*cos(x);

figure;
plot(x,y);
xlabel('x');
ylabel('f(x)');