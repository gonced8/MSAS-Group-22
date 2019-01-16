function plot_graph(name, t, X, parout)
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
    
    a = figure;
    
    switch name
        case 'forces'
            hold on;
            plot(t, D);
            plot(t, T);
            title('forces');
            legend('drag', 'thrust');
            xlabel('t [s]');
            grid;
            
        case 'Vout'
            plot(t, Vout);
            title('Vout');
            xlabel('t [s]');
            grid;
            
        case 'x_fcv'
            plot(t, x_fcv);
            title('x fcv');
            xlabel('t [s]');
            grid;
            
        case 'x_acc'
            plot(t, x_acc);
            title('x acc');
            xlabel('t [s]');
            grid;

        case 'height'
            plot(t, H);
            title('orbit height');
            xlabel('t [s]');
            grid;

        case 'i_fcv'
            plot(t, i_fcv);
            title('i fcv');
            xlabel('t [s]');
            grid;

        case 'v_fcv'
            plot(t, v_fcv);
            title('v fcv');
            xlabel('t [s]');
            grid;

        case 'Vi'
            plot(t, Vi);
            title('Vi');
            xlabel('t [s]');
            grid;

        case 'v_acc'
            plot(t, v_acc);
            title('vacc');
            xlabel('t [s]');
            grid;

        case 'w'
            plot(t, w);
            title('w');
            xlabel('t [s]');
            grid;

        case 'Omega'
            plot(t, Omega);
            title('Omega');
            xlabel('t [s]');
            grid;

        case 'e'
            plot(t, e);
            title('e');
            xlabel('t [s]');
            grid;

        case 'a1+a2'
            plot(t, a1+a2);
            title('a1+a2');
            xlabel('t [s]');
            grid;
            
        otherwise
            close(a);
    end