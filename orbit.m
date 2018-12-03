function Y = orbit(t, X, par)
    a = X(1);
    e = X(2);
    i = X(3);
    Omega = X(4);
    w = X(5);
    f = X(6);
    
    h = sqrt(par.u*a*(1-e^2));
    r = a*(1-e^2)/(1+e*cos(f));
    R = get_R(X);
    H = get_altitude(X, par);
    v = sqrt(2*par.u*(1/r-1/(2*a)));
    V = get_V(X, par);
    
    aJ2 = J2_perturbation(r, R, V, par);
    ad = drag(v, H, par);
    
    acc = aJ2+ad;
    
    at = acc(1);
    ah = acc(2);
    an = acc(3);
    
    da = 2*a^2*v/par.u*at;
    de = 1/v*(2*(e+cos(f))*at-r/a*sin(f)*an);
    di = r*cos(w+f)/h*ah;
    dOmega = r*sin(w+f)/(h*sin(i))*ah;
    dw = 1/(e*v)*(2*sin(f)*at+(2*e+r/a*cos(f))*an)-(r*sin(w+f)*cos(i))/(h*sin(i))*ah;
    df = h/r^2-1/(e*v)*(2*sin(f)*at+(2*e+r/a*cos(f))*an);
    
    Y = [da; de; di; dOmega; dw; df];
end