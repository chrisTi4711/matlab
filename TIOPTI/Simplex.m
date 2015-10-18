clc
% (Values from Lay Exercise 5)

% A contains the constraint AND the slack variables
A = [
    2 3 4 1 0 0
    3 1 5 0 1 0 
    1 2 1 0 0 1
    ];
b =  [60; 46; 50];
c = -[25; 33; 18; 0; 0; 0];

%specify here the slack variables columns 
v = [4;5;6];

%option five to show details, like pivot element, and intermediate passages
simplex(c,A,b,v,5);

