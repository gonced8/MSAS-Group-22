function [a, D] = drag(v, H, par)
    rho = density(H);
    D = 0.5*rho*(v*1e3)^2*par.A*par.Cd;     % [kg*m/s^2]
    
    ad = (D*1e-3)/par.m;                           % [km/s^2]
    
    at = -ad;
    ah = 0;
    an = 0;
    
    a = [at; ah; an];    
end

