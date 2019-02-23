% Modified bt Toby Thomas, 2016
function out = Gauss_2D_Q4(a,b,c,d,M,N)
%function that integrates the field A using Gaussian integration
%INPUT:
%a: Lower limit of x
%b: Upper limit of x
%c: Lower limit of y
%d: Upper Limit of y
%M: gauss points for function y
%N: gauss points for function x

%TOBY  THOMAS

%define Jacobian
% Since x = (b - a)*e + a and y = (d - c)*n + c, and the Jacobian is a
% matrix of [dx/de, dx/dn; dy/de, dy/dn]
J = [(b - a), 0 ; 0, (d - c)];
J = det(J);

% define grid vectors 
% Get the weights and coordinates of x and y using the gw function
[wx, xg] = gw(N);
[wy, yg] = gw(M);

% Create a grid of the x and y weights
[wxg, wyg] = ndgrid(wx,wy);

% Create an array of x and y coordinates for the region we want
xx = (b - a)*xg + a;
yy = (d - c)*yg + c;
% Create a grid of the x and y coordinates of the region
[xxg, yyg] = ndgrid(xx,yy);

%sample our image at interpolated gird points
% Get the f(x,y) values for each point in the region we want

f = (xxg.^4).*exp(yyg.^2);
%U = interp2(X,Y,A,xxg,yyg);

%sum solutions
% Use the formula for gaussian integration in 2D, which is the jacobian 
% determinant times the sum of product of x and y weights with each f(x,y)
out = J*sum(sum(wxg.*wyg.*f));

