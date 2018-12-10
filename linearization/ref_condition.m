function [x_rc] = ref_condition(data)

    % Renaming data 
    xenon = data.xenon;
    orb = data.orbit;
    fcv = data.fcv;
    
    %--------- Reference condition ---------%
    
    % Orbit 
    a_rc = orb.a0;
    e_rc = orb.e0;
    i_rc = orb.i0;
    Omega_rc = orb.Omega0;
    w_rc = orb.w0;
    f_rc = orb.f0;
    orbit_rc = [a_rc;
                e_rc;
                i_rc;
                Omega_rc;
                w_rc;
                f_rc];
            
    % Accelerometer
        % States
    x_acc_rc = 0;
    v_acc_rc = 0;
    Vout_rc = 0;
    accel_rc = [x_acc_rc;
                v_acc_rc;
                Vout_rc];
        % Parameters
    D = 1.96444e-3;  
    T = D;
    
    % Flow control valve 

    mdot = T/xenon.vi;
    A_star = mdot/(xenon.rho_star*xenon.v_star);
    x_s_rc = A_star/xenon.width;
    v_s_rc = 0;
    f_press = xenon.p_star*xenon.width*xenon.depth;
    i_s = (fcv.K*x_s_rc + fcv.F0 - f_press)/fcv.Ki;
    iV_rc = i_s/fcv.ki;
    fcv_rc = [iV_rc;
              x_s_rc;
              v_s_rc];
    %---------------------------------------%
    x_rc = [orbit_rc;
            accel_rc;
            fcv_rc];
end
