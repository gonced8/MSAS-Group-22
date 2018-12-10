function [dif_opt] = sensiv(field, optim_cell, x_rc, data2)

    dif_opt = cell(1,length(optim_cell));

    for ii = 1:length(optim_cell)
        epsilon = max(sqrt(eps),sqrt(eps)*abs(data2.(field).(optim_cell{ii})));
        data2.(field).(optim_cell{ii}) = data2.(field).(optim_cell{ii}) + epsilon;
        aux1 = lin_model(x_rc,data2);
        data2.(field).(optim_cell{ii}) = data2.(field).(optim_cell{ii}) - 2*epsilon;
        aux2 = lin_model(x_rc,data2);
        dif_opt{ii} = (aux1 - aux2)/(2*epsilon);
    end

