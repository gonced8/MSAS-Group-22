%%%%%% XENON %%%%%%
data.xenon.p0 = 2e5   % Pa
data.xenon.T0 = 240   % K
data.xenon.gamma = 1.66
data.xenon.R = 63.33  % J/KgK

data.xenon.rho0 = data.xenon.p0/(data.xenon.R*data.xenon.T0)

% total prop wrt critical prop

data.xenon.T_star = 2*data.xenon.T0/(data.xenon.gamma+1)
data.xenon.p_star = data.xenon.p0*(((data.xenon.gamma+1)/2)^(data.xenon.gamma/(1-data.xenon.gamma)))
data.xenon.rho_star = data.xenon.rho0*(((data.xenon.gamma+1)/2)^(1/(1-data.xenon.gamma)))

data.xenon.a_star = sqrt(data.xenon.gamma*data.xenon.R*data.xenon.T_star) % speed of sound at the throat
data.xenon.M = 1     % mach number at the throat

data.xenon.v_star = data.xenon.M*data.xenon.a_star % velocity at the throat

data.xenon.R = data.fcv.d/2 % radius
%%%%%%%%%%%%%%%%%%
x=2*data.xenon.R % dummy x
A_star =  data.xenon.R^2*acos((data.xenon.R-x)/data.xenon.R)-(data.xenon.R-x)*sqrt(2*data.xenon.R*x-x^2) % -> need input x
m_dot = data.xenon.rho_star*A_star*data.xenon.v_star % kg/s xenon mass flow rate 