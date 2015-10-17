
% (Values from Lay Example 3)

% Payoff matrix (amount R wins from C):
A = [
    10    -5     5
     1     1    -1
     0   -10    -5
    ];

% Probability vectors:
x = [0.25  0.5 0.25]';
y = [0.25 0.25 0.5 ]';

disp('Worst that could happen to R for each decision:')
row_minimas = min(A')'
disp('Worst that could happen to R for right choice:')
max(row_minimas)

disp('Worst that could happen to C for each decision:')
col_maximas = max(A)
disp('Worst that could happen to C for right choice:')
min(col_maximas)

disp('Expected payoff E(x,y):')
x'*A*y

disp('Value of the strategy v(x):')
min(x'*A*eye(size(A)))

disp('Value of the strategy v(y):')
max(eye(size(A))'*A*y)
