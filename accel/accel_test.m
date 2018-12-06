%% Simulation of the GOCE DFACS accelerometer 
clear;
close all;

% Obtaining accel data

data_accel;

% Simulation
tspan = 100;
X0 = [0, 0, 0];
options = odeset('Reltol',2.5e-7,'AbsTol',2.5e-9, 'MaxStep', 1e-1);
[t, X] = ode113(@accel_mod, [0 tspan], X0, options, data.accel);

figure;
plot(t, X(:,1));
title('Accel mass position');

figure;
plot(t, X(:,2));
title('Accel mass velocity');

figure;
plot(t, X(:,3));
title('Vout');

[~, parout] = accel_mod(0, X0, data.accel);
parout = zeros(length(t), length(parout));

for k = 1:length(t)
    [~, parout(k, :)] = accel_mod(t(k), X(k, :), data.accel);
end

%pars = [D,T,V_c,C1,C2]
D = parout(:, 1);
T = parout(:, 2); 
C1 = parout(:, 3);
C2 = parout(:, 4);
Vc = parout(:, 5);
a1 = parout(:, 6);
a2 = parout(:, 7);

% figure;
% plot(t, T);
% title('thrust');

figure;
plot(t, D/300);
title('drag');

figure;
plot(t, C1);
title('C1');

figure;
plot(t, C2);
title('C2');

figure;
plot(t, Vc);
title('Vc');

figure;
plot(t, a1+a2);
title('a1 +a2');