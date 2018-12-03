function parout = thruster(x, data)
    A_star = compute_A(x, 2*data.xenon.R);
    mdot = data.xenon.rho_star*A_star*data.xenon.v_star; % kg/s xenon mass flow rate 
    
    Ib= mdot*data.q/data.M;
    T = mdot*sqrt(2*data.q*data.Vb/data.M);
    
    parout = [mdot, Ib, T];
end

