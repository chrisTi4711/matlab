%Level set
%HKa sep. 2014

% %Nice surface
% [X,Y] = meshgrid(-2:.2:2,-2:.2:3);
% Z = X.*exp(-X.^2-Y.^2);

% %Rosenbrock's function, example 5.2 in [CZ 4e]
% [X,Y] = meshgrid(-2:.2:2,-2:.2:3);
% Z = 100*(Y-X.^2).^2+(1-X).^2;

 %Example 6.3 in [CZ]
% [X,Y] = meshgrid(-5:.2:5,-5:.2:5);
% Z= X.^2+0.5*Y.^2+3*Y+4.5; 

% %Example 6.7 in [CZ 4e]
%[X,Y] = meshgrid(-2:.2:2,-2:.2:2);
%Z= X.^2-Y.^2; 

% %Example from Lay
[X,Y] = meshgrid(-10:.2:20,-10:.2:20);
Z=X.^2-Y.^2;
Z2=2.*X.*Y;

figure(1)
surf(X,Y,Z);

figure(2)
[C,h] = contour(X, Y, Z, [12 5]);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
hold
[C,h] = contour(X, Y, Z2, [16 16]);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap cool

figure(3)
[C,h] = contourf(X,Y,Z,10);
colormap autumn
colorbar
