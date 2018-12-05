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

%tspan = 1*data.orbit.T;
tspan = 24*3600;
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

start = tic;
disp('Simulation started');

[t, X] = ode15s(@model, [0 tspan], X0, options, data);

disp('Simulation finished');
toc(start)

start = tic;
disp('Calculating parameters');

[~, parout] = model(0, X0, data);
parout = zeros(length(t), length(parout));

for k = 1:length(t)
    [~, parout(k, :)] = model(t(k), X(k, :), data);
end

toc(start);
disp('Calculation finished');

%%%%%%%%%%%%% States %%%%%%%%%%%%%%%%
a = X(:, 1);
e = X(:, 2);
i = X(:, 3);
Omega = X(:, 4);
w = X(:, 5);
f = X(:, 6);

x_acc = X(:, 7);
v_acc = X(:, 8);
Vout = X(:, 9);

Vi = X(:, 10);
x_fcv = X(:, 11);
v_fcv = X(:, 12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Parameters %%%%%%%%%%%%%
mdot = parout(:, 1);
Ib = parout(:, 2);
T = parout(:, 3);

D = parout(:, 4);
h = parout(:, 5);
r = parout(:, 6);
H = parout(:, 7);
v = parout(:, 8);

C1 = parout(:, 9);
C2 = parout(:, 10);
Vc = parout(:, 11);
a1 = parout(:, 12);
a2 = parout(:, 13);

i = parout(:, 14);
f = parout(:, 15);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold on;
plot(t, D);
plot(t, T);
title('forces');
legend('drag', 'thrust');

figure;
plot(t, Vout);
title('Vout');

figure;
plot(t, x_fcv);
title('x fcv');

figure;
plot(t, x_acc);
title('x acc');

figure;
plot(t, H);
title('orbit height');

figure;
plot(t, i);
title('i fcv');

figure;
plot(t, v_fcv);
title('v fcv');

figure;
plot(t, Vi);
title('Vi');

figure;
plot(t, v_acc);
title('vacc');

figure;
plot(t, w);
title('w');

figure;
plot(t, e);
title('e');

figure;
plot(t, a1+a2);
title('a1+a2');

speed = 100000;

