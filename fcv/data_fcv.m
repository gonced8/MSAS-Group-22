% Data of the flow control valve
%%%%%%%%%%%%%%%%%%%%%%%%%%% FCV DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.fcv.A = 1e-5;%1e-5;                      % m^2
data.fcv.m = 2e-1;%2e-1;                      % kg      optimizable
data.fcv.Ki = 2e-3; %0.2;                      % N/A optimizable
data.fcv.kp = 1e-4;%0.1;                      %         optimizable
data.fcv.ki = 3e-3;%3;                        %         optimizable
data.fcv.K = 7e3;                       % N/m   
data.fcv.c = 3e1;                        % Ns/m 
data.fcv.F0 = 1e0 * data.xenon.p_star*data.xenon.width*data.xenon.depth;
                    %max( data.xenon.p_star*data.xenon.width*data.xenon.depth, ... 
                   %data.xenon.p0*data.xenon.width*data.xenon.depth/2 ); % N

data.fcv.depth=data.xenon.depth; %depth of valve along flow direction
%Duct
data.fcv.width=data.xenon.width; %width of duct in which xenon flows
data.fcv.d = data.fcv.A/data.fcv.width;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data.fcv.Vi0 = 0;
data.fcv.x0 = 0;
data.fcv.v0 = 0;