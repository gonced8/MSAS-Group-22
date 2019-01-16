clear
close all

addContainingDirAndSubDir()

% Load data 
initial_data;

% Load reference nominal condition

tspan = 3600;
options = odeset('AbsTol', 1e-9, 'RelTol', 1e-8);

[t, X] = ode15s(@model, [0 tspan], X0, options, data);

x_rc = X(end,:).';

%%%%%%%%%%% Linearization %%%%%%%%%%%%

eigval = lin_model(@model, x_rc, data);
figure; hold on; grid on;
plot(eigval,'*')
title('Eigenvalues of linearized model');

% Compute sensitivity to optimizable parameters
    % Study about how the eigenvalues change for changes in the parameters

    % Accelerometer parameters
optim_acc = {'kp','c','k'};
dif_acc_opt = sensiv(@model, 'accel', optim_acc, x_rc, data);
    % Flow control valve parameters
optim_fcv = {'m','Ki','kp','ki'};
dif_fcv_opt = sensiv(@model, 'fcv', optim_fcv, x_rc, data);
