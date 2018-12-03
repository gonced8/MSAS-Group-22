function RR = get_R(X)   
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
    
    r = a*(1-e^2)/(1+e*cos(f));

    R = [r.*cos(f);
         r.*sin(f);
         0];
     
    RR = R3(-Omega)*R1(-i)*R3(-w)*R;
end