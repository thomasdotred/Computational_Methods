function A = scenario3(y,t)

% Example 1 return the value A defined by
% dy/dt = Ay
% Input: 
% y: population
% t: time

% Rate infected people on Ping and Pong
PiIR = 0.2; PoIR = 0.2;% 

% Death rate on ping
PiDR = 0.1; PoDR = 0.1;

% cure rate
CR = 0.15;

% Commuters rate Ping to Pong
Pi2Po = 0.05;

% Commuters rate from Pong to Ping
Po2Pi = 0.05;

% proportion of healty commuters
Xpi = 0.5;
Xpo = 0.5;

% matrix of coefficients
A = [-(PiIR+Pi2Po*Xpi) CR                       0.0    Po2Pi*Xpo         0.0                      0.0;
       PiIR            -(PiDR+Pi2Po*(1-Xpi)+CR) 0.0    0.0               Po2Pi*(1-Xpo)            0.0;
       0.0             PiDR                     0.0    0.0               0.0                      0.0;
       Pi2Po*Xpi       0.0                      0.0    -(PoIR+Po2Pi*Xpo) CR                       0.0;
       0.0             Pi2Po*(1-Xpi)            0.0    PoIR              -(PoDR+Po2Pi*(1-Xpo)+CR) 0.0;
       0.0             0.0                      0.0    0.0               PoDR                     0.0;];
    




end
