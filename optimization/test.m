function test(par)
    initial_data;
    
    data.accel.kp = par(1);
    data.accel.c = par(2);
    data.accel.k = par(3);
    data.fcv.m = par(4);
    data.fcv.kp = par(5);
    data.fcv.ki = par(6);

    tspan = 2*data.orbit.T;
    %tspan = 24*3600;
    options = odeset('Events', @eventfcn, 'AbsTol', 1e-8, 'RelTol', 1e-6);

    start = tic;
    disp('Simulation started');

    [t, X, ~, ~, ~] = ode15s(@model, [0 tspan], X0, options, data);

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

    states_parameters;
    
    %%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%
    plot_graph('forces', t, X, parout);
    plot_graph('height', t, X, parout);
    plot_graph('x_acc', t, X, parout);
    plot_graph('x_fcv', t, X, parout);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end