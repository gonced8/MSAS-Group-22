function VV = get_V(X, par)   
    a = X(1);
    e = X(2);
    i = X(3);
    Omega = X(4);
    w = X(5);
    f = X(6);
    
    R1 = @(a) [1        0       0
               0        cos(a)  sin(a)
               0        -sin(a) cos(a)];
           
    R3 = @(a) [cos(a)   sin(a)  0
               -sin(a)  cos(a)  0
               0        0       1];
    
    h = sqrt(par.u*a*(1-e^2));
    r = a*(1-e^2)/(1+e*cos(f));

    vr = par.u/h*e*sin(f);
    vt = h/r;
    vz = 0;
    
    v = [vr; vt; vz];
     
    VV = R3(-Omega)*R1(-i)*R3(-w)*v;
end