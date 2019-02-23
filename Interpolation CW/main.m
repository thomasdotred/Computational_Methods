% Toby Thomas, 2016

clear;
close all
%% Load Triangles
%prompt user to enter file name
tri = uigetfile;
load(tri);

%Manipulate data for use in other functions
[tri_val,n,xv,yv,x_start,x_stop,y_start,y_stop] = manip_data(pt1,pt2,pt3);

%if file describes a 2D triangle, convert points to 1x3 array so that 2D
%triangles can be plotted with the same function (plot3()) as 3D triangles
%to reduce cost
if n ==2
    pt1(3) = 0;
    pt2(3) = 0;
    pt3(3) = 0;
end

tri_val = [pt1; pt2; pt3; pt1];

%plot triangle
plot_tri(tri_val,x_start,x_stop,y_start,y_stop,tri)

%plot random point
%generate random point and plot within triangle using random scales s and t
%multiplied by the three vectors that define each corner
[t,s,P]=plot_rand(pt1,pt2,pt3);
hold on
plot3(P(1),P(2),P(3),'xr')
hold off

%% plot grid
%plot triangle again with limits on axis
plot_tri(tri_val,x_start,x_stop,y_start,y_stop,tri)

%plot grid onto triangle graph
hold on
plot_grid(n,x_start,x_stop,y_start,y_stop,xv,yv)
hold off
