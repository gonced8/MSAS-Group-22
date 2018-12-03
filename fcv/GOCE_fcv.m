clc, clear, close all

data_fcv;

% parameters
tspan = 50;

% Input
V0 = 6e-4;         % volt

% Initial condition
X0 = [0,0,0];

% Integration
options = odeset('Reltol', 1e-6, 'AbsTol', 1e-8);

start = tic;
[tt, X] = ode113(@fcv, [0 tspan], X0, options, data.fcv, V0);
toc(start)

figure;
plot (tt, X(:, 2));
title('x(t)');
xlabel('t [s]');
ylabel('x [m]');
grid on;

figure;
plot (tt, X(:, 3));
title('v(t)');
xlabel('t [s]');
grid on;
ylabel('v [m/s]');