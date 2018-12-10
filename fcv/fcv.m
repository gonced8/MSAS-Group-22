function [Y, parout] = fcv(t, X, parin, data, data_x)
% Function describing the behaviour of the flow control valve
    Vi = X(1);
    x  = X(2);
    v  = X(3);

    V0 = parin(1);

    i = data.kp*V0+data.ki*Vi;
    f = pressure_force(x, data_x);

    parout = [i, f];
    
    Vi_dot = V0;
    x_dot = v;
    v_dot = 1/data.m*(data.Ki*i  - data.c*v - data.K*x - data.F0 + f);

    v_dot = correct_v(v_dot, x, data.d);
    
    Y = [Vi_dot;
         x_dot;
         v_dot];
end




