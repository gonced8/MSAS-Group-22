% ACCELEROMETER DATA

%-------------Parameters-------------%
data.accel.e0 = 8.854e-12;              %[F/m] permittivity between plates
data.accel.er = 78.4;                   %water relative permittivity
data.accel.e = data.accel.er*data.accel.e0;
data.accel.A = 1.6e-3;                  %[m^2] plates are
data.accel.m = 0.5; %0.32;                    %[kg]  seismic mass 
data.accel.g = 1e-3; %5e-4;                    %[m]   electrodes-mass gap
data.accel.Vbias = 5; %15;                  %[V]   bias voltage
data.accel.Cf = 2e-12;                  %[F]   positive feedback capacitor
data.accel.C = data.accel.e*data.accel.A/(2*data.accel.g);

data.accel.m_goce = 300;

% Optimizable 
data.accel.kp = 1e6;                    %[]    controller proportional gain
%data.accel.kd = 5e4;                    %[]    controller derivative gain
data.accel.c = 1;

%------------------------------------%

data.accel.x0 = 0;
data.accel.v0 = 0;
data.accel.Vout = 0;