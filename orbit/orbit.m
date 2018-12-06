function [Y, parout] = orbit(t, X, parin, data)
    a = X(1);
    e = X(2);
    i = X(3);
    Omega = X(4);
    w = X(5);
    f = X(6);
    
    T = parin(1);
    
    h = sqrt(data.u*a*(1-e^2));
    r = a*(1-e^2)/(1+e*cos(f));
    R = get_R(X);
    H = get_altitude(X, data);
    v = sqrt(2*data.u*(1/r-1/(2*a)));
    V = get_V(X, data);
    
    aJ2 = J2_perturbation(r, R, V, data);
    [ad, D] = drag(v, H, data);
    
    at = aJ2(1) + ad(1) + T*(1e-3)/data.m;
    an = aJ2(2) + ad(2);
    ah = aJ2(3) + ad(3);
    
    parout = [D, h, r, H, v, R.'];
    
    da = 2*a^2*v/data.u*at;
    de = 1/v*(2*(e+cos(f))*at-r/a*sin(f)*an);
    di = r*cos(w+f)/h*ah;
    dOmega = r*sin(w+f)/(h*sin(i))*ah;
    dw = 1/(e*v)*(2*sin(f)*at+(2*e+r/a*cos(f))*an)-(r*sin(w+f)*cos(i))/(h*sin(i))*ah;
    df = h/r^2-1/(e*v)*(2*sin(f)*at+(2*e+r/a*cos(f))*an);
    
    Y = [da; de; di; dOmega; dw; df];
end