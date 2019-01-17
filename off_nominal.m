% Off-nominal conditions:
% 1 - accelerometer stuck
% 2 - valve stuck

clear
close all

addContainingDirAndSubDir();

% Load data and X0
initial_data;

tspan = 1*data.orbit.T;
%tspan = 24*3600;
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

off.cond = ['1'; '2'];
off.time = [3000, 4200];

for j = 1:length(off.cond)

    start = tic;
    disp(off.cond(j));
    disp('Simulation started');

    t1 = []; t2 = []; t3 = [];
    X1 = []; X2 = []; X3 = [];

    if tspan>off.time(1)
        % Nominal conditions
        [t1, X1] = ode15s(@model, [0 off.time(1)], X0, options, data);

        % Off-nominal conditions
        X0_off = off_nominal_X(X1(end, :), off.cond(j)).';
        [t2, X2] = ode15s(@model_off, off.time, X0_off, options, data, off.cond(j));

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

    states_parameters;      % get the variables form the X and parout arrays.
    
    %%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%
    fig = figure;
    hold on;

    subplot(1, 2, 1);
    plot_graph_off('forces', t, X, parout, off.time, off.cond(j), fig);
    
    subplot(1, 2, 2);
    switch off.cond(j)
        case '1'
            plot_graph_off('x_acc', t, X, parout, off.time, off.cond(j), fig);
        case '2'
            plot_graph_off('x_fcv', t, X, parout, off.time, off.cond(j), fig);
    end
    
    %saveas(gcf, sprintf('figs/off_nom%s', off.cond(j)), 'epsc');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end