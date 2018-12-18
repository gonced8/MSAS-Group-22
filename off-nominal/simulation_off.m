clear
close all

% Load data and X0
initial_data;

tspan = 1000;
%tspan = 1*data.orbit.T;
%tspan = 24*3600;
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

off.cond = '1';
off.time = [300, 400];

start = tic;
disp('Simulation started');

t1 = []; t2 = []; t3 = [];
X1 = []; X2 = []; X3 = [];

if tspan>off.time(1)
    % Nominal conditions
    [t1, X1] = ode15s(@model, [0 off.time(1)], X0, options, data);
    
    % Off-nominal conditions
    X0_off = off_nominal_X(X1(end, :), off.cond).';
    [t2, X2] = ode15s(@model_off, off.time, X0_off, options, data, off);
    
    if tspan>off.time(2)
        % Recovering from off-nominal conditions
        [t3, X3] = ode15s(@model, [off.time(2) tspan], X2(end, :), options, data);
    end
else
    % If off-nominal conditions never occur
    [t1, X1] = ode15s(@model, [0 tspan], X0, options, data);
end

t = [t1; t2; t3];
X = [X1; X2; X3];

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
plot_graph_off('forces', t, X, parout, off.time);
plot_graph_off('height', t, X, parout, off.time);
plot_graph_off('x_acc', t, X, parout, off.time);
plot_graph_off('x_fcv', t, X, parout, off.time);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
