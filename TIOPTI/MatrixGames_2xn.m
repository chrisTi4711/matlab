clear;clc;
% (Values from Lay Exercise 15)

% 2xn payoff matrix (REMOVE DOMINATING COLUMNS!)
A = [4 2 0;1 2 5];

% Calculate v(x)
t = 0:0.0001:1;
vx = min(A'*[1-t;t])';

% Calculate M from two intersecting lines (choose one on vx!)
lineA = 2; %col in A
lineB = 3; %col in A
syms tM
fA = A(:,lineA)'*[1-tM;tM];
fB = A(:,lineB)'*[1-tM;tM];
tM = solve(fA==fB);
zM = eval(fA);
M = [tM zM];

optimal_strategy_x = [1-tM; tM]
optimal_strategy_y = [A;ones(1,size(A,2))]\[zM zM 1]'

% print graph
plot(0:1, A, 'b',...   
     t, vx, 'r.',...     
     tM, zM, 'bo')
xlabel('t')
ylabel('z')