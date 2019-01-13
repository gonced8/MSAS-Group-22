clear
close all

addContainingDirAndSubDir()

% Load data 
data_thruster;
data_orbit;
data_accel;
data_fcv;

%%%%%%%%%%% Linearization %%%%%%%%%%%%

x_rc = ref_condition(data);
eigval = lin_model(@model, x_rc, data);

disp('Eigenvalues:');
disp(eigval);

figure; hold on; grid on;
plot(eigval,'*')
title('Eigenvalues of linearized model around a reference condition');
grid on;
xlabel('$Re\{h\lambda\}$', 'Interpreter', 'latex');
ylabel('$Im\{h\lambda\}$', 'Interpreter', 'latex');
set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');


% Compute sensitivity to optimizable parameters

    % Accelerometer parameters
optim_acc = {'kp','c','k'};
dif_acc_opt = sensiv(@model, 'accel', optim_acc, x_rc, data);
    % Flow control valve parameters
optim_fcv = {'m','Ki','kp','ki'};
dif_fcv_opt = sensiv(@model, 'fcv', optim_fcv, x_rc, data);
