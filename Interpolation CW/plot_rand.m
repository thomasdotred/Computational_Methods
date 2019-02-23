% Toby Thomas, 2016
function [t,s,P]=plot_rand(pt1,pt2,pt3)
%Usage:
%function to provide a random point within a triangle
%Input:
%pt1,pt2,pt3: Specified Corners of triangle

t = sqrt(rand);
s = rand;
P = (1-t)*pt1 + t*((1-s)*pt2+s*pt3);



end