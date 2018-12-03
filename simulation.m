clear
close all

addContainingDirAndSubDir()

data_thruster;
data_orbit;
data_accel;
data_fcv;

X0_orbit = [data.orbit.a0; 
            data.orbit.e0;
            data.orbit.i0;
            data.orbit.Omega0;
            data.orbit.w0;
            data.orbit.f0];
        
X0_accel = [data.accel.x0;
            data.accel.v0;
            data.accel.Vout];
        
X0_fcv = [data.fcv.Vi0;
          data.fcv.x0;
          data.fcv.v0];
      
X0 = [X0_orbit;
      X0_accel;
      X0_fcv];

tspan = 10000;
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

[t, X] = ode15s(@model, [0 tspan], X0, options, data);

[~, parout] = model(0, X0, data);
parout = zeros(length(t), length(parout));

for k = 1:length(t)
    [~, parout(k, :)] = model(t(k), X(k, :), data);
end

figure;
plot(t, parout(:, 4));
title('drag');

figure;
plot(t, parout(:, 3));
title('thrust');

figure;





