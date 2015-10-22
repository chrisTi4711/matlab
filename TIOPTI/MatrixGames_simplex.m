clear;clc;
% Lay p.54 Exercise 21
% Solution see HW 3

A=[
    4 1 -2 1 0 0
    1 3  0 0 1 0
   -1 0  4 0 0 1
   ];

offset = 3; % smallest value has to be > 0
X=[offset*ones(3,3),zeros(3,3)]; 
A=A+X;

b =  [1;1;1];
c = -[1;1;1;0;0;0];
v =  [4;5;6];

opt_sol_y = simplex(c,A,b,v,1)
% Read this from last simplex tableau (bottom row, 
% columns associated with slack variables:
opt_sol_x = [1/13;9/143;15/143] 

lambda = sum(opt_sol_y)

opt_mix_strategy_y_C = opt_sol_y ./ lambda
opt_mix_strategy_x_R = opt_sol_x ./ lambda

value_of_game = 1./lambda-offset