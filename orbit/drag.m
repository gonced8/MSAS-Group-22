function a = drag(v, H, par)
    rho = density(H);
    D = 0.5*rho*v^2*par.A*par.Cd;
    
    ad = D/par.m;
    
    at = -ad;
    ah = 0;
    an = 0;
    
    a = [at; ah; an];
end

