function test(par)
    close all;
    
    initial_data;
        
    for j = 0:1
        if j==1
            data.accel.kp = par(1);
            data.accel.c = par(2);
            data.accel.k = par(3);
            data.fcv.m = par(4);
            data.fcv.kp = par(5);
            data.fcv.ki = par(6);
        end

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
        ts = find(t>1000, 1, 'first');
        figure(1); hold on;
        titlestr={'before', 'after'};
        
        subplot(2, 2, j*2+1);
        plot(t(1:ts), D(1:ts), t(1:ts), T(1:ts));
        xlabel('t [s]');
        ylabel('force [N]');
        legend('drag', 'thrust', 'location', 'southeast');
        grid;
        title(sprintf('Drag and thrust %s optimization', titlestr{j+1}));
        
        subplot(2, 2, j*2+2);
        plot(t(ts:end)/3600, D(ts:end), t(ts:end)/3600, T(ts:end));
        xlabel('t [h]');
        ylabel('force [N]');
        legend('drag', 'thrust', 'location', 'northeast');
        grid;
        title(sprintf('Drag and thrust %s optimization', titlestr{j+1}));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end