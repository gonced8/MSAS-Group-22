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

data.xenon.p0 = 2e5;   % Pa
data.xenon.T0 = 240;   % K
data.xenon.gamma = 1.66;
data.xenon.R = 63.33;  % J/KgK

data.xenon.rho0 = data.xenon.p0/(data.xenon.R*data.xenon.T0); % rho

data.xenon.T_star = 2*data.xenon.T0/(data.xenon.gamma+1);
data.xenon.p_star = data.xenon.p0*(((data.xenon.gamma+1)/2)^(data.xenon.gamma/(1-data.xenon.gamma)));
data.xenon.rho_star = data.xenon.rho0*(((data.xenon.gamma+1)/2)^(1/(1-data.xenon.gamma)));

data.xenon.a_star = sqrt(data.xenon.gamma*data.xenon.R*data.xenon.T_star); % speed of sound at the throat
data.xenon.M = 1;     % mach number at the throat

data.xenon.v_star = data.xenon.M*data.xenon.a_star; % velocity at the throat

data.xenon.R = data.fcv.d/2; % radius

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%