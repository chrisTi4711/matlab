clear; clc;

syms x1 x2 y1 y2 v % lambda represented as v

% f(x)
%f = x1*x2;
f = 4*x1+x2.^2

% h(x)
%h = x1.^2+4*x2.^2 -1;
h = x1.^2+x2.^2-9
m = 1; % h: Rn -> Rm

% Lagrangian function
l = f+v*h;

% Lagrange condition (FONC)
fprintf('The Lagrange condition for this problem is\n');
Dxl = [diff(l,x1);diff(l,x2)] == [0;0]
Dvl = h == 0

% Solve
[p_x1, p_x2, p_v] = solve([Dxl,Dvl],[x1,x2,v]);
n_points = size(p_x1,1);
fprintf('We have %i points satisfying the Lagrange condition:\n',n_points);

% Check regularity and apply SOSC
Dh = jacobian(h);
F = hessian(f);
H = hessian(h);
gh = gradient(h);

for i=1:n_points,
    fprintf('\nPoint %i:-----------------\n', i);
    x1 = p_x1(i) % use only one point at a time
    x2 = p_x2(i) % use only one point at a time
    v = p_v(i)   % use only one point at a time
    
    regular = rank(eval(Dh)) == m;
    
    if regular,
        fprintf('-> is regular\n');
        
        % SOSC
        fprintf('We now apply the SOSC. We have\n');
        L = F+v*H
        T = eval(gh)'*[y1;y2] == [0;0]
%         not_zero = [y1 y2] ~= [0 0];
%         [y1_s, y2_s] = solve([T not_zero], [y1 y2])
%         y = [y1_s; y2_s]
%         yTLy = y'*L*y
%         if yTLy > 0
%             fprintf('-> strict local minimizer\n');
%         elseif yTLy == 0
%             fprintf('-> local minimizer\n');
%         else
%             fprintf('-> strict local maximizer\n');
%         end
      
    else
        fprintf('-> is NOT regular\n');
    end
end
