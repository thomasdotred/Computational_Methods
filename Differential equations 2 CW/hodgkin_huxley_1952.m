%===============================================================================
% CellML file:   C:\Users\Steven Niederer\Downloads\hodgkin_huxley_1952.tar\hodgkin_huxley_1952\hodgkin_huxley_1952-3c7e163f501d\hodgkin_huxley_1952.cellml
% CellML model:  hodgkin_huxley_squid_axon_1952
% Date and time: 17/01/2014 at 14:42:11
%-------------------------------------------------------------------------------
% Conversion from CellML 1.0 to MATLAB (init) was done using COR (0.9.31.1409)
%    Copyright 2002-2014 Dr Alan Garny
%    http://cor.physiol.ox.ac.uk/ - cor@physiol.ox.ac.uk
%-------------------------------------------------------------------------------
% http://www.cellml.org/
%===============================================================================

function dY = hodgkin_huxley_1952(time, Y)

%-------------------------------------------------------------------------------
% Initial conditions
%-------------------------------------------------------------------------------

% Y = [-75.0, 0.325, 0.6, 0.05];

% YNames = {'V', 'n', 'h', 'm'};
% YUnits = {'millivolt', 'dimensionless', 'dimensionless', 'dimensionless'};
% YComponents = {'membrane', 'potassium_channel_n_gate', 'sodium_channel_h_gate', 'sodium_channel_m_gate'};

%-------------------------------------------------------------------------------
% State variables
%-------------------------------------------------------------------------------

% 1: V (millivolt) (in membrane)
% 2: n (dimensionless) (in potassium_channel_n_gate)
% 3: h (dimensionless) (in sodium_channel_h_gate)
% 4: m (dimensionless) (in sodium_channel_m_gate)

%-------------------------------------------------------------------------------
% Constants
%-------------------------------------------------------------------------------

g_L = 0.3;   % milliS_per_cm2 (in leakage_current)
Cm = 1.0;   % microF_per_cm2 (in membrane)
E_R = -75.0;   % millivolt (in membrane)
g_K = 36.0;   % milliS_per_cm2 (in potassium_channel)
g_Na = 120.0;   % milliS_per_cm2 (in sodium_channel)

%-------------------------------------------------------------------------------
% Computed variables
%-------------------------------------------------------------------------------

% E_L (millivolt) (in leakage_current)
% i_L (microA_per_cm2) (in leakage_current)
% i_Stim (microA_per_cm2) (in membrane)
% alpha_n (per_millisecond) (in potassium_channel_n_gate)
% beta_n (per_millisecond) (in potassium_channel_n_gate)
% E_K (millivolt) (in potassium_channel)
% i_K (microA_per_cm2) (in potassium_channel)
% alpha_h (per_millisecond) (in sodium_channel_h_gate)
% beta_h (per_millisecond) (in sodium_channel_h_gate)
% alpha_m (per_millisecond) (in sodium_channel_m_gate)
% beta_m (per_millisecond) (in sodium_channel_m_gate)
% E_Na (millivolt) (in sodium_channel)
% i_Na (microA_per_cm2) (in sodium_channel)

%-------------------------------------------------------------------------------
% Computation
%-------------------------------------------------------------------------------

% time (millisecond)

E_L = E_R+10.613;
i_L = g_L*(Y(1)-E_L);

if ((time >= 10.0) && (time <= 10.5))
   i_Stim = 20.0;
else
   i_Stim = 0.0;
end;

E_Na = E_R+115.0;
i_Na = g_Na*Y(4)^3.0*Y(3)*(Y(1)-E_Na);
E_K = E_R-12.0;
i_K = g_K*Y(2)^4.0*(Y(1)-E_K);
dY(1, 1) = -(-i_Stim+i_Na+i_K+i_L)/Cm;
alpha_n = -0.01*(Y(1)+65.0)/(exp(-(Y(1)+65.0)/10.0)-1.0);
beta_n = 0.125*exp((Y(1)+75.0)/80.0);
dY(2, 1) = alpha_n*(1.0-Y(2))-beta_n*Y(2);
alpha_h = 0.07*exp(-(Y(1)+75.0)/20.0);
beta_h = 1.0/(exp(-(Y(1)+45.0)/10.0)+1.0);
dY(3, 1) = alpha_h*(1.0-Y(3))-beta_h*Y(3);
alpha_m = -0.1*(Y(1)+50.0)/(exp(-(Y(1)+50.0)/10.0)-1.0);
beta_m = 4.0*exp(-(Y(1)+75.0)/18.0);
dY(4, 1) = alpha_m*(1.0-Y(4))-beta_m*Y(4);

%===============================================================================
% End of file
%===============================================================================
