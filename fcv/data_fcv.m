%%%%%%%%%%%%%%%%%%%%%%%%%%% FCV DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.fcv.A = 1e-5;                      % m^2
data.fcv.m = 0.2;                       % kg
data.fcv.Ki = 0.2;                      % N/A
data.fcv.kp = 62500;                    %
data.fcv.ki = 20000;                    %
data.fcv.K = 7e3;                       % N/m
data.fcv.c = 30;                        % Ns/m
data.fcv.F0 = 10;                       % N
data.fcv.d = sqrt(4*data.fcv.A/pi);

%%%%%%%%%%%%%%%%%%%%%%%%%% XENON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data.fcv.xenon.p0 = 2e5;   % Pa
data.fcv.xenon.T0 = 240;   % K
data.fcv.xenon.gamma = 1.66;
data.fcv.xenon.R = 63.33;  % J/KgK

data.fcv.xenon.rho0 = data.fcv.xenon.p0/(data.fcv.xenon.R*data.fcv.xenon.T0); % rho

data.fcv.xenon.T_star = 2*data.fcv.xenon.T0/(data.fcv.xenon.gamma+1);
data.fcv.xenon.p_star = data.fcv.xenon.p0*(((data.fcv.xenon.gamma+1)/2)^(data.fcv.xenon.gamma/(1-data.fcv.xenon.gamma)));
data.fcv.xenon.rho_star = data.fcv.xenon.rho0*(((data.fcv.xenon.gamma+1)/2)^(1/(1-data.fcv.xenon.gamma)));

data.fcv.xenon.a_star = sqrt(data.fcv.xenon.gamma*data.fcv.xenon.R*data.fcv.xenon.T_star); % speed of sound at the throat
data.fcv.xenon.M = 1;     % mach number at the throat

data.fcv.xenon.v_star = data.fcv.xenon.M*data.fcv.xenon.a_star; % velocity at the throat

data.fcv.xenon.R = data.fcv.d/2; % radius

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%