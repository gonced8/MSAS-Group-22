function [a, D] = drag(v, H, par)
    rho = density(H);
    D = 0.5*rho*(v*1e3)^2*par.A*par.Cd;     % [kg*m/s^2]
    
    ad = (D*1e-3)/par.m;                           % [km/s^2]
    
    at = -ad;
    an = 0;
    ah = 0;
    
    a = [at; an; ah];    
end

