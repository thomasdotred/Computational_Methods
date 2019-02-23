% Toby Thomas, 2016
function  [tri_val,n,xv,yv,x_start,x_stop,y_start,y_stop] = manip_data(pt1,pt2,pt3)
%Usage:
%this function manipulates data in different ways and assigns it to arrays
%which are used by other functions in the main script.

%input:
% pt1 - 2D vertice 1 of triangle
% pt2 - 2D vertice 2 of triangle
% pt3 - 2D vertice 3 of triangle

% Output:
% tri_val - array with vertices ready for plotting in plot_tri
% n = Number of dimentions that the triangle exists in
% xv - array containing x co-ords of vertices
% yv - array containing y co-ords of vertices
% 


%assigns points to a variable to be used to plot the triangle
tri_val = [pt1; pt2; pt3; pt1];

%Find the number of dimentions that this triangle exists in
[m n] = size(tri_val);


%assign all x values to one array and all y values to another
xv = [pt1(1),pt2(1),pt3(1)];
yv = [pt1(2),pt2(2),pt3(2)];

%limits for axis:
x_start = floor(min(xv)-1);
x_stop = ceil(max(xv)+1);
y_start = floor(min(yv)-1);
y_stop = ceil(max(yv)+1);

%assigns points to a variable to be used to plot the triangle
tri_val = [pt1; pt2; pt3; pt1];



end