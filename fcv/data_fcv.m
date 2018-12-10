% Data of the flow control valve
%%%%%%%%%%%%%%%%%%%%%%%%%%% FCV DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.fcv.A = 1e-5;                      % m^2
data.fcv.m = 2e-1;                      % kg
data.fcv.Ki = 2; % 0.2;                 % N/A
data.fcv.kp = 0.1;                      %
data.fcv.ki = 3;                        %
data.fcv.K = 7e3;                       % N/m
data.fcv.c = 30;                        % Ns/m
data.fcv.F0 = max( data.xenon.p_star*data.xenon.width*data.xenon.depth, ... 
                   data.xenon.p0*data.xenon.width*data.xenon.depth/2 ); % N

data.fcv.depth=1e-5; %depth of valve along flow direction
%Duct
data.fcv.width=1e-8; %width of duct in which xenon flows
data.fcv.d = data.fcv.A/data.fcv.width;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data.fcv.Vi0 = 0;
data.fcv.x0 = 0;
data.fcv.v0 = 0;