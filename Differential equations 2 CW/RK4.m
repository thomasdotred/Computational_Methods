function [y, t] = RK4(Eq,Y0,t0,Tend,Nstep)
% Toby Thomas, 2016
%Eq_deinfes the equation that will be integrated
%Y0 is the intiial conditions
%to is the time that integration is starting
%Tend is the final time
%Nstep is the number of steps 

%define increment
inc = (Tend-t0)/Nstep;

%initialisation of time and solution array
y = zeros(length(Y0), Nstep);
t = t0:inc:Tend;
y(:,1) = Y0;

%loop over solution
for i = 2:Nstep
    %calcaulte derivatives
    k_1 = Eq(t(i),y(:,i));
    k_2 = Eq(t(i)+0.5*inc,y(:,i)+0.5*inc*k_1);
    k_3 = Eq((t(i) +0.5*inc),(y(:,i)+0.5*inc*k_2));
    k_4 = Eq((t(i)+inc),(y(:,i)+k_3*inc));
    
    %update solution
    y(:,i+1) = y(:,i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*inc;
end