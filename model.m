function [Y, parout] = model(t, X, data)
    X_orbit = X(1:6);
    X_acc = X(7:9);
    X_fcv = X(10:12);
     
    X_fcv(2) = correct_x(X_fcv(2), data.fcv.d);
    X_fcv(3) = correct_v(X_fcv(3), X_fcv(2), data.fcv.d);
    
    x_fcv = X_fcv(2);
    par_thruster = thruster(x_fcv,  data.xenon);
    T = par_thruster(3);
    
    [Y_orbit, par_orbit] = orbit(t, X_orbit, T, data.orbit);
    D = par_orbit(1);
    
    [Y_accel, par_accel] = accel(t, X_acc, [T, D], data.accel);
    Vout = X_acc(3);
    
    [Y_fcv, par_fcv] = fcv(t, X_fcv, Vout, data.fcv, data.xenon);
    
    Y = [Y_orbit;
         Y_accel;
         Y_fcv];

    parout = [par_thruster, par_orbit, par_accel, par_fcv];
end

