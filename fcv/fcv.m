function [Y, parout] = fcv(t, X, parin, data_f, data_x)
    Vi = X(1);
    x  = X(2);
    v  = X(3);

    V0 = parin(1);

    x = correct_x(x, data_f.d);
    v = correct_v(v, x, data_f.d);

    i = data_f.kp*V0+data_f.ki*Vi;
    f = pressure_force(x, data_x.p_star, data_f.As);

    parout = [i, f];

    Vi_dot = V0;
    x_dot = v;
    v_dot = 1/data_f.m*(data_f.Ki*i  -data_f.c*v - data_f.K*x - data_f.F0 + f);

    v_dot = correct_v(v_dot, x, data_f.d);

    Y = [Vi_dot;
         x_dot;
         v_dot];
end




