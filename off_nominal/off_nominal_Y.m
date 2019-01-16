function Y = off_nominal_Y(Y, conds)
    for cond = conds
        switch cond

            case '1'    % accelerometer stuck
                Y(7) = 0;       % dx_acc = 0
                Y(8) = 0;       % dv_acc = 0
                
            case '2'    % valve stuck
                Y(11) = 0;      % dx_fcv = 0
                Y(12) = 0;      % dv_fcv = 0
    
        end
    end
end

