function [Y, parout] = fcv(t, X, par, V0)

Vi = X(1);
x  = X(2);
v  = X(3);

x = correct_x(x, par.d);
v = correct_v(v, x, par.d);

V0 = V0-t/5000*V0;

i = par.kp*V0+par.ki*Vi;

Vi_dot = V0;
x_dot = v;
v_dot = 1/par.m*(par.Ki*i-par.c*v-par.K*x-par.F0);

v_dot = correct_v(v_dot, x, par.d);

A_star =  par.xenon.R^2*acos((par.xenon.R-x)/par.xenon.R)-(par.xenon.R-x)*sqrt(2*par.xenon.R*x-x^2); % -> need input x
m_dot = par.xenon.rho_star*A_star*par.xenon.v_star; % kg/s xenon mass flow rate 

parout = [A_star, m_dot];

Y = [Vi_dot;
     x_dot;
	 v_dot];




