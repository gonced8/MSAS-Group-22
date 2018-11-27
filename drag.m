function a = drag(v, H, par)
    v = v*10^3;         % km/s -> m/s
    rho = density(H);
    D = 0.5*rho*v^2*par.A*par.Cd;
    
    D = D/par.m;
    
    at = -D;
    ah = 0;
    an = 0;
    
    a = [at; ah; an];
end

