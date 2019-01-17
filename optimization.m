clear
close all

addContainingDirAndSubDir();

disp('Optimization started');
start = tic;
[par, err] = optimize();
save('optimization/results_optimization.mat', 'par', '-v7.3');
toc(start);
disp('Optimization ended');

test(par);
% saveas(gcf, 'figs/optimization_results', 'epsc');


function [par, err] = optimize() 
    % Load all data and initial conditions for simulation

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
                data.accel.Vout0];

    X0_fcv = [data.fcv.Vi0;
              data.fcv.x0;
              data.fcv.v0];

    X0 = [X0_orbit;
          X0_accel;
          X0_fcv];


    tspan = 2*data.orbit.T;
    %tspan = 24*3600;
    tspan = [0, tspan];
    options = odeset('Events', @eventfcn, 'AbsTol', 1e-8, 'RelTol', 1e-6);

    time = 0;
    ie = 0;
    
    par0 = [data.accel.kp;
            data.accel.c;
            data.accel.k;
            data.fcv.m;
            data.fcv.kp;
            data.fcv.ki];
        
%     lb = [-inf;
%           0;
%           0;
%           0;
%           -inf;
%           -inf];
%       
%     ub = [inf;
%           data.accel.c;
%           inf;
%           10;
%           inf;
%           inf];

    lb = 0.1*par0;
    ub = 10*par0;
    
    optoptions = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'active-set', 'StepTolerance', 1e-6, 'MaxFunctionEvaluations', 100);
    
    [par, err] = fmincon(@opt_fcn, par0, [], [], [], [], lb, ub, @nonlcon, optoptions);
    
    function y = opt_fcn(par)
        data.accel.kp = par(1);
        data.accel.c = par(2);
        data.accel.k = par(3);
        data.fcv.m = par(4);
        data.fcv.kp = par(5);
        data.fcv.ki = par(6);
        
        start = tic();
        [t, X, ~, ~, ie] = ode15s(@model, tspan, X0, options, data);
        time = toc(start);

        [~, parout] = model(0, X0, data);
        parout = zeros(length(t), length(parout));

        for k = 1:length(t)
            [~, parout(k, :)] = model(t(k), X(k, :), data);
        end

        T = parout(:, 3);
        D = parout(:, 4);
        
        y = norm(D-T)^2;
    end

    function [c, ceq] = nonlcon(~)
        c = time-10;           % keep simulation time lower than 10s
        ceq = length(ie);      % keep x_acc and x_fcv within the limits
    end
end