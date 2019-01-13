data.orbit.Ra = 6378.16;           % [km]
data.orbit.Rb = 6356.778;          % [km]
data.orbit.R = (data.orbit.Ra+data.orbit.Rb)/2;  % [km]
data.orbit.u = 3.986e5;            % [km^3/s^2]
data.orbit.tol = 1e-6;             % tolerance in altitude determination newton method
data.orbit.m = 300;                % [kg]
data.orbit.A = 1.1;                % [m^2]
data.orbit.B = 300;                % ballistic coefficient
data.orbit.Cd = data.orbit.m/(data.orbit.A*data.orbit.B);   % Drag coefficient
data.orbit.J2 = 0.00108263;   


data.orbit.h0 = 254.9;                 % [km]

data.orbit.e0 = 0.0045;                % Singularity for e=0
data.orbit.a0 = (data.orbit.Ra+data.orbit.h0)/(1-data.orbit.e0);    % periapsis=Ra+h0
data.orbit.i0 = deg2rad(90);           % [rad] Singularity for i=0
data.orbit.Omega0 = 0;
data.orbit.w0 = 0;
data.orbit.f0 = 0;                     % body starts at periapsis

data.orbit.T = ceil(4*pi*sqrt(data.orbit.a0^3/data.orbit.u));      % [s]