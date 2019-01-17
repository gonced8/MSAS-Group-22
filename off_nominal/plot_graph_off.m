% Use this function to plot the results of the simulation with off-nominal
% conditions.

function plot_graph_off(name, t, X, parout, tt, cond, fig)
    states_parameters;
    
    switch cond
        case '1'
            cond = 'accelerometer stuck';
        case '2'
            cond = 'valve stuck';
        otherwise
            cond = '';
    end
       
    figure(fig);
    hold on;
    
    switch name
        case 'forces'
            plot(t/3600, D, 'color', [0, 0.8, 0]);
            plot([t(t<=tt(1))/3600; nan; t(t>=tt(2))/3600], [T(t<=tt(1)); nan; T(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2))/3600, T(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('forces (%s)', cond));
            legend('drag', 'thrust nominal', 'thrust off-nominal');
            xlabel('t [h]');
            ylabel('forces [N]');
            grid;
            
        case 'Vout'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Vout(t<=tt(1)); nan; Vout(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Vout(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Vout (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'x_fcv'
            plot([t(t<=tt(1))/3600; nan; t(t>=tt(2))/3600], [x_fcv(t<=tt(1)); nan; x_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2))/3600, x_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('x fcv (%s)', cond));
            legend('nominal', 'off-nominal');
            xlabel('t [h]');
            ylabel('x_{fcv} [m]');
            grid;
            
        case 'x_acc'
            plot([t(t<=tt(1))/3600; nan; t(t>=tt(2))/3600], [x_acc(t<=tt(1)); nan; x_acc(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2))/3600, x_acc(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('x acc (%s)', cond));
            legend('nominal', 'off-nominal');
            xlabel('t [h]');
            ylabel('x_{acc} [m]');
            grid;
            
        case 'height'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [H(t<=tt(1)); nan; H(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), H(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('orbit height (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'i_fcv'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [i_fcv(t<=tt(1)); nan; i_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), i_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('i fcv (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'v_fcv'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [v_fcv(t<=tt(1)); nan; v_fcv(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), v_fcv(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('v fcv (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'Vi'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Vi(t<=tt(1)); nan; Vi(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Vi(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Vi (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'v_acc'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [v_acc(t<=tt(1)); nan; v_acc(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), v_acc(t>=tt(1) & t<=tt(2)), 'r');;
            title(sprintf('vacc (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'w'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [w(t<=tt(1)); nan; w(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), w(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('w (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'Omega'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [Omega(t<=tt(1)); nan; Omega(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), Omega(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('Omega (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'e'
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [e(t<=tt(1)); nan; e(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), e(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('e (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        case 'a1+a2'
            aa = a1+a2;
            plot([t(t<=tt(1)); nan; t(t>=tt(2))], [aa(t<=tt(1)); nan; aa(t>=tt(2))], 'b');
            plot(t(t>=tt(1) & t<=tt(2)), aa(t>=tt(1) & t<=tt(2)), 'r');
            title(sprintf('a1+a2 (%s)', cond));
            legend('nominal', 'off-nominal');
            grid;
            
        otherwise
            close(a);
            
    end