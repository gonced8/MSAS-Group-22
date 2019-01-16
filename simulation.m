clear
close all

addContainingDirAndSubDir();

% Load data and X0
initial_data;

tspan = 5*data.orbit.T;
%tspan = 24*3600;
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

states_parameters;      % get the variables form the X and parout arrays.

%%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%
plot_graph('forces', t, X, parout);
plot_graph('height', t, X, parout);
plot_graph('x_acc', t, X, parout);
plot_graph('x_fcv', t, X, parout);
plot_graph('a1+a2', t, X, parout);
plot_graph('w', t, X, parout);
plot_graph('Omega', t, X, parout);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(2, 2, 1);
plot(t/3600, H);
title('Altitude of the spacecraft');
xlabel('t [h]');
ylabel('H [km]');
grid;
subplot(2, 2, 2);
plot(t/3600, w);
title('Argument of periapsis');
xlabel('t [h]');
ylabel('\omega [rad]');
grid;
subplot(2, 2, 3);
plot(t/3600, a);
title('Orbital semi-major axis');
xlabel('t [h]');
ylabel('a [km]');
grid;
subplot(2, 2, 4);
plot(t/3600, e);
title('Orbital eccentricity');
xlabel('t [h]');
ylabel('e');
grid;
% saveas(gcf, 'figs/orbit', 'epsc');
