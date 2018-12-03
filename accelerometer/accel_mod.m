function [Y, parout] = accel_mod(t, X, acc)
% States of the system 
x = X(1);
v = X(2);
Vout = X(3);


% TEST drag and thrust
BC = 300;              % M/(Cd*A)
m_goce = 300;          %[kg]
A_goce = 1.1;          %[m^2]
mu_earth = 3.896e14;   % standard gravitacional constant 
v_c = sqrt(mu_earth/((6371+250)*10^3));   % approx circular orbit h=250km

Cd = m_goce/(BC*A_goce);

rho_orb = 7.35e-11;

D_i = 0.5*Cd*rho_orb*v_c^2*A_goce;
T_i = D_i*0.9;

if t <= 5
    D = D_i;
elseif t>5 && t<10
    D = D_i*t/5;
else
    D = 2*D_i;
end

T=0;
% if t <= 7
%     T = T_i;
% elseif t>7 && t<12
%     T = T_i*(t-2)/5;
% else
%     T = 2*T_i;
% end


% Compute V_c
% V_out_eq = -(2*accel.e*accel.A)/(accel.g*accel.C_f)*accel.V_bias;
% V_0 = -accel.k_p*V_out_eq;
% V_c = accel.k_p*V_out + accel.k_d*V_diff + V_0;

% Compute capacitances C1 and C2 of accelerometor plates
C1 = acc.e*acc.A/(acc.g-x);
C2 = acc.e*acc.A/(acc.g+x);

Vc = acc.kp*Vout;

a1 = (1/acc.m)*C1*(Vc-acc.Vbias)*(0.5*(Vc-acc.Vbias)/(acc.g-x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));
a2 = (1/acc.m)*C2*(Vc+acc.Vbias)*(-0.5*(Vc+acc.Vbias)/(acc.g+x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));
% any pars needed?
pars = [D, T, C1, C2, Vc, a1, a2];

% ODEs
dx = v;
dv = (1/m_goce)*(D - T) + a1 + a2 - v;
dVout = v/(1+acc.kp*acc.C/acc.Cf)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x));

Y = [dx;
     dv;
     dVout];

parout = pars;

end

