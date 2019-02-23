% Toby Thomas, 2016
function plot_grid(n,x_start,x_stop,y_start,y_stop,xv,yv)
%Usage:
%Plot grid onto graph with triangle
%identify whether a grid point lies within/on the surface of or outside the
%triangle
%red --> outside 
%black --> inside/on edge
%Input:
%n: Number of dimentions the specified triangle exists in
%x_start,x_stop,y_start,y_stop: values that that the grid will exist between 
%xv: x co-ordinates of corners
%yv: y co-ordinates of corners

if n == 2
    for e = y_start:y_stop
        for w = x_start:x_stop
            in = inpolygon(w,e,xv,yv);
            if in == 1
                plot(w,e,'.k')
            else
                plot(w,e,'.r')
            end
        end
    end
end

end