function plot_graph_off(name, t, X, parout, tt, cond)
    %%%%%%%%%%%%% States %%%%%%%%%%%%%%%%
    a = X(:, 1);            % major axis
    e = X(:, 2);            % eccentricity
    i = X(:, 3);            % inclination
    Omega = X(:, 4);        % right assenction
    w = X(:, 5);            % declination
    f = X(:, 6);            % true anomaly

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
    
    switch cond
        case '1'
            cond = 'accelerometer stuck';
        case '2'
            cond = 'valve stuck';
        otherwise
            cond = '';
    end
    
    
    a = figure;
    hold on;
    
    switch name
        case 'forces'
            plot(t, D, 'g');
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [T(t<=tt(1)); nan; T(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), T(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('forces (%s)', cond));
            legend('drag', 'thrust nominal', 'thrust off-nominal');
            
        case 'Vout'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Vout(t<=tt(1)); nan; Vout(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Vout(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Vout (%s)', cond));
            legend('nominal', 'off-nominal');
            
        case 'x_fcv'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [x_fcv(t<=tt(1)); nan; x_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), x_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('x fcv (%s)', cond));
            legend('nominal', 'off-nominal');
            
        case 'x_acc'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [x_acc(t<=tt(1)); nan; x_acc(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), x_acc(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('x acc (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'height'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [H(t<=tt(1)); nan; H(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), H(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('orbit height (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'i_fcv'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [i_fcv(t<=tt(1)); nan; i_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), i_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('i fcv (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'v_fcv'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [v_fcv(t<=tt(1)); nan; v_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), v_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('v fcv (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'Vi'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Vi(t<=tt(1)); nan; Vi(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Vi(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Vi (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'v_acc'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [v_acc(t<=tt(1)); nan; v_acc(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), v_acc(t>=tt(1) & t<=tt(2)), 'r');;
            title(sprintf('vacc (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'w'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [w(t<=tt(1)); nan; w(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), w(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('w (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'Omega'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Omega(t<=tt(1)); nan; Omega(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Omega(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Omega (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'e'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [e(t<=tt(1)); nan; e(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), e(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('e (%s)', cond));
            legend('nominal', 'off-nominal');

        case 'a1+a2'
            aa = a1+a2;
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [aa(t<=tt(1)); nan; aa(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), aa(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('a1+a2 (%s)', cond));
            legend('nominal', 'off-nominal');
            
        otherwise
            close(a);
            
    end