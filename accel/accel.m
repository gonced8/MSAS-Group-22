function [Y, parout] = accel(t, X, acc, parin)
    % States of the system 
    x = X(1);
    v = X(2);
    Vout = X(3);

    T = parin(1);
    D = parin(2);

    % TEST drag and thrust
%     BC = 300;              % M/(Cd*A)
%     m_goce = 300;          %[kg]
%     A_goce = 1.1;          %[m^2]
%     mu_earth = 3.896e14;   % standard gravitacional constant 
%     v_c = sqrt(mu_earth/((6371+250)*10^3));   % approx circular orbit h=250km
% 
%     Cd = m_goce/(BC*A_goce);
% 
%     rho_orb = 7.35e-11;

    % D_i = 0.5*Cd*rho_orb*v_c^2*A_goce;
    % T_i = D_i*0.9;

    % if t <= 5
    %     D = D_i;
    % elseif t>5 && t<10
    %     D = D_i*t/5;
    % else
    %     D = 2*D_i;
    % end

    % if t <= 7
    %     T = T_i;
    % elseif t>7 && t<12
    %     T = T_i*(t-2)/5;
    % else
    %     T = 2*T_i;
    % end

    % Compute capacitances C1 and C2 of accelerometor plates
    C1 = acc.e*acc.A/(acc.g-x);
    C2 = acc.e*acc.A/(acc.g+x);

    Vc = acc.kp*Vout;

    a1 = (1/acc.m)*C1*(Vc-acc.Vbias)*(0.5*(Vc-acc.Vbias)/(acc.g-x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));
    a2 = (1/acc.m)*C2*(Vc+acc.Vbias)*(-0.5*(Vc+acc.Vbias)/(acc.g+x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));

    parout = [C1, C2, Vc, a1, a2];

    % ODEs
    dx = v;
    dv = (1/acc.m_goce)*(D - T) + a1 + a2 - 1*v;
    dVout = v/(1+acc.kp*acc.C/acc.Cf)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x));

    Y = [dx;
         dv;
         dVout];
end

