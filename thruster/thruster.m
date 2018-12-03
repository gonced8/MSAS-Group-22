function parout = thruster(x, data_t, data_x)
    A_star = compute_A(x, data_x.d0);
    mdot = data_x.rho_star*A_star*data_x.v_star; % kg/s xenon mass flow rate 
    
    Ib= mdot*data_t.q/data_t.M;
    T = mdot*sqrt(2*data_t.q*data_t.Vb/data_t.M);
    
    parout = [mdot, Ib, T];
end

