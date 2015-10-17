
% (Values from Lay Example 4)

% 2xn payoff matrix
A = [ 1 5 3 6; 4 0 1 2];

% Print matrix from which the column lines can be drawn:
t = 0:1;
z = (1-t')*A(1,:)+t'*A(2,:)

% Calculate highest point M
resolution = 0.0001;
th = 0:resolution:1; % higher t resultion needed
zh = (1-th')*A(1,:)+th'*A(2,:);

lowest_z_values = min(zh')';
M_z = max(mz);
M_t = (find(mz==max(lowest_z_values))-1) .* resolution;

M = [M_t, M_z]

optimal_strategy_x = [1-M_t; M_t]

% print graph
plot(t, z, 'b',...   
     th, lowest_z_values, 'r.',...     
     M_t, M_z, 'bo')
 xlabel('t')
 ylabel('z')