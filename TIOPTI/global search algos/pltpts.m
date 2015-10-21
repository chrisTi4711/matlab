function out=pltpts(xnew,xcurr)

h=animatedline();
addpoints(h,[xcurr(1),xnew(1)],[xcurr(2),xnew(2)]);
drawnow update; % Draws current graph now
%pause(1)

out = [];
