% 1. Calculate intersection between two selected inequaltities.
% 2. Check if the intersection point is in the feasible set.

A = [ 
    5 2
    .2 .4
    .2 .2
    ];
b = [ 200 ; 16 ; 10 ];
c = [20 ; 26];

pick = [1 2] % select inqeuality pairs for lines here

intersection_x = A(pick,:)\b(pick,:);

fx = c'*intersection_x

satisfied_inequalities = A*intersection_x <= b;
if (all(satisfied_inequalities))
    disp('-> feasible solution')
else
    disp('-> NOT IN THE FEASIBLE SET!')
    satisfied_inequalities
end
