% Toby Thomas, 2016
function []=plot_tri(tri_val,x_start,x_stop,y_start,y_stop,tri)
%usage:
%function to plot triangle on new figure
%input:
%tri_val: array containing specified corners of triangle

figure;
hold on
plot3(tri_val(:,1),tri_val(:,2),tri_val(:,3))
axis([x_start-1 x_stop+1 y_start-1 y_stop+1])
title(tri)
xlabel('x')
ylabel('y')
zlabel('z')

end
