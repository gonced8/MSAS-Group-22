function [dif_opt] = sensiv(f, field, optim_cell, x_rc, data)

    dif_opt = cell(1,length(optim_cell));
    
    for ii = 1:length(optim_cell)
        epsilon = max(sqrt(eps),sqrt(eps)*abs(data.(field).(optim_cell{ii})));
        data.(field).(optim_cell{ii}) = data.(field).(optim_cell{ii}) + epsilon;
        
        % computing eigen values for data + epsilon
        aux1 = lin_model(f, x_rc,data); 
        
        data.(field).(optim_cell{ii}) = data.(field).(optim_cell{ii}) - 2*epsilon;
        
        % computing eigen values for data - epsilon
        aux2 = lin_model(f, x_rc,data);

        dif_opt{1,ii} = (aux1 - aux2)/(2*epsilon);
    end

