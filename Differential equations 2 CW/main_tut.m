% Code provided for CW 
%% Outbreak 
% We have been asked to calculate the spread of disease XX living the
% islands Ping and Pong. 
% XX is a contagious and fatal disease.  if a one or more infected person
% is on the island then 20% of the healthy population 
% are infected each day. XX also is fatal for 10% of sufferes per
% day.

%close all open plots
close all

%% Request SOLVER, SCENARIO and number of STEPS from user
SOLVER =  input('Please select the solution method 1) FE, 2) BE, 3) ME:   ');
SCENARIO = input('Please select (1,2,3 or 4): ');
STEPS = input('please enter the number of steps: ');

%% Initialise array of function handles for the three methods (FE, BE, ME)
integrators = {@FE_tut, @BE_tut, @ME_tut};
  
%% Initial conditions here (total population, infected, dead...)
%Initial population
pop_pin = 1000;
pop_pon = 1000;

inf_pin = 10;
inf_pon = 0;

dead_pin = 0;
dead_pon = 0;

y0 = [pop_pin;
    inf_pin;
    dead_pin;
    pop_pon;
    inf_pon;
    dead_pon;];


%% Start and End times of simulation
t0 = 0;
Tend = 100;

tic
%% Select scenario to solve
switch SCENARIO
    case 1
        % %Solve 2ns Scenario
        [y, t] = integrators{SOLVER}(@scenario1,Tend,STEPS,y0,t0);
    case 2
        % %Solve 2ns Scenario 
        [y, t] = integrators{SOLVER}(@scenario2,Tend,STEPS,y0,t0);
    case 3
         %Solve 3rd Scenario
        [y, t] = integrators{SOLVER}(@scenario3,Tend,STEPS,y0,t0);
end
timer = toc;
%% Plot results
plot(t,y)

%label plot
xlabel('time (days)');
ylabel('Number of people');

%create legend
legend('Healthy Ping','Infected Ping','Dead Ping','Healthy Pong','Infected Pong','Dead Pong')
fprintf('%d\n', timer)