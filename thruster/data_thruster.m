data.xenon.q = 1.6e-19;
data.xenon.Mx = 2.188e-25;
data.xenon.Vb = 2e3;
data.xenon.vi = sqrt(2*data.xenon.q*data.xenon.Vb/data.xenon.Mx);

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

data.xenon.A0 = 1e-5;
data.xenon.d0 = 2*sqrt(data.xenon.A0/pi);