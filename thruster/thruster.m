function parout = thruster(x, data)
    A_star = x*data.width;
    mdot = data.rho_star*A_star*data.v_star;    % kg/s xenon mass flow rate 
    
    Ib= mdot*data.q/data.Mx;
    T = mdot*data.vi;
    
    parout = [mdot, Ib, T];
end

