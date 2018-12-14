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

%%%%%%%%%%%%% States %%%%%%%%%%%%%%%%
a = X(:, 1);            % major axis
e = X(:, 2);            % eccentricity
i = X(:, 3);            % inclination
Omega = X(:, 4);        % right assenction
w = X(:, 5);            % declination
f = X(:, 6);            % ---

x_acc = X(:, 7);        % position of the mass in the accelerometer
v_acc = X(:, 8);        % velocity of the mass in the accelerometer
Vout = X(:, 9);         % output voltage

Vi = X(:, 10);          % integral of voltage
x_fcv = X(:, 11);       % position of the spool
v_fcv = X(:, 12);       % velocity of the spool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Parameters %%%%%%%%%%%%%
mdot = parout(:, 1);  % mass flow rate of the xenon
Ib = parout(:, 2);
T = parout(:, 3);

D = parout(:, 4);
h = parout(:, 5);
r = parout(:, 6);
H = parout(:, 7);
v = parout(:, 8);
R = parout(:, 9:11);

C1 = parout(:, 12);
C2 = parout(:, 13);
Vc = parout(:, 14);
a1 = parout(:, 15);
a2 = parout(:, 16);

i_fcv = parout(:, 17);
f_fcv = parout(:, 18);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%
plot_graph('forces', t, X, parout);
plot_graph('height', t, X, parout);
plot_graph('x_acc', t, X, parout);
plot_graph('x_fcv', t, X, parout);
plot_graph('a1+a2', t, X, parout);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
