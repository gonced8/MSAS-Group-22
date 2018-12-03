function [Y, parout] = accel(t, X, parin, acc)
    % States of the system 
    x = X(1);
    v = X(2);
    Vout = X(3);

    T = parin(1);
    D = parin(2);

    % Compute capacitances C1 and C2 of accelerometor plates
    C1 = acc.e*acc.A/(acc.g-x);
    C2 = acc.e*acc.A/(acc.g+x);

    Vc = acc.kp*Vout;

    a1 = (1/acc.m)*C1*(Vc-acc.Vbias)*(0.5*(Vc-acc.Vbias)/(acc.g-x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));
    a2 = (1/acc.m)*C2*(Vc+acc.Vbias)*(-0.5*(Vc+acc.Vbias)/(acc.g+x)+acc.kp/(1+acc.C/acc.Cf*acc.kp)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x)));

    parout = [C1, C2, Vc, a1, a2];

    % ODEs
    dx = v;
    dv = (1/acc.m_goce)*(D - T) + a1 + a2 - acc.c*v;
    dVout = v/(1+acc.kp*acc.C/acc.Cf)*(C2/acc.Cf*(Vc+acc.Vbias)/(acc.g+x)-C1/acc.Cf*(Vc-acc.Vbias)/(acc.g-x));

    Y = [dx;
         dv;
         dVout];
end

