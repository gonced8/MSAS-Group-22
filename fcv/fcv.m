function ff= fcv(t,xx,pars,V0)

k_pv = pars(1);
k_iv = pars(2);
M    = pars(3);
Ki   = pars(4);
c    = pars(5);
K    = pars(6);
F0   = pars(7);
x_max = pars(8);

Vi = xx(1);
x  = xx(2);
v  = xx(3);

if x<0
    x=0;
end
if x <= 0 && v < 0
    x = 0;
    v = 0;
end
if x > x_max
    x = x_max;
end
if x >= x_max && v > 0
    x = x_max;
    v = 0;
end
V0 = V0-t/5000*V0;

i = k_pv*V0+k_iv*Vi

Vi_dot = V0;
x_dot = v;
v_dot = (Ki*i-c*v-K*x-F0)/M;

if (x >= x_max && v_dot > 0) || (x <= 0 && v_dot < 0)
    x_dot = 0;
    v_dot = 0;
end

ff = zeros(3,1);
ff(1) =  Vi_dot;
ff(2) =  x_dot;
ff(3) =  v_dot;

ff

