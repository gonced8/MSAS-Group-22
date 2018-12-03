function [Y, parout] = model(t, X, data)
    X_orbit = X(1:6);
    X_acc = X(7:9);
    X_fcv = X(10:12);
    
    x = X_fcv(2);
    par_thruster = thruster(x, data.thruster, data.xenon);
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

