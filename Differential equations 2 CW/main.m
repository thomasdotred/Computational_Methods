%Main Script
% Edited by Toby Thomas for coursework submission
clear all
close all
%get user inputs
display(' Solution method:');
display('  1: Runge Kutta, explicit modified Euler *not for this coursework*');
display('  2: Runge Kutta, mid point *not for this coursework*');
display('  3: 3rd Order Runge Kutta *not for this coursework*');
display('  4: 4th Order Runge Kutta');
display('  5: ode45');
display('  6: ode23');
display('  7: ode15s');
SOLVER =  input('Please enter the solution method for solving the Hodgkin and Huxley equations:   ');

%Define Function 
Eq = @hodgkin_huxley_1952;

%Initial Conditions
Y0 = [-75.0, 0.325, 0.6, 0.05];

%Start time 
t0 = 0;

%End time
Tend = 50;

%Nsteps
Nstep = 5000;

%solve solution
tic
switch SOLVER
    case 1
        %Solve 2nd order Runge-Kutta Modified Euler Explicit
        [y, t] = RK2MEE(Eq,Y0,t0,Tend,Nstep);
    case 2
        %Solve 2nd order Runge-Kutta Midpoint 
        [y, t] = RK2MP(Eq,Y0,t0,Tend,Nstep);
    case 3
        %Solve 3rd order Runge-Kutta
        [y, t] = RK3(Eq,Y0,t0,Tend,Nstep);
    case 4
        %Solve 4th order Runge-Kutta
        [y, t] = RK4(Eq,Y0,t0,Tend,Nstep);
    case 5
        %solve ode45
        %options = odeset('RelTol',1e-4,'AbsTol',1e-4);
        [t,y] = ode45(Eq,[t0 Tend],Y0);
    case 6
        %solve ode23
        [t,y] = ode23(Eq,[t0 Tend],Y0);
    case 7
        %solve ode15s
        options = odeset('RelTol',1e-7,'AbsTol',1e-8);
        [t,y] = ode15s(Eq,[t0 Tend],Y0, options);

end
toc
%plot result
plot(t,y,'g')
xlabel('Time (ms)');
ylabel('Membrane Potential (mV)');



