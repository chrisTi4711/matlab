clear;clc
% (Values from Lay Exercise 5)

% A contains the constraint
A = [
    2 3 4
    3 1 5
    1 2 1
    ];
b =  [60; 46; 50];
c = -[25; 33; 18];

% auto add slack variables:
n_slack = size(b,1);
A = [A,eye(n_slack)]
b
c = [c;zeros(size(b,1),1)]

v = (size(A,2)-n_slack+1):size(A,2) %slack var columns

%option five to show details, like pivot element, and intermediate passages
simplex(c,A,b,v,5);

