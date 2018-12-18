function X = off_nominal_X(X, conds)
    for cond = conds
        switch cond

            case '1'    % accelerometer stuck
                X(8) = 0;       % v_acc = 0
                
            case '2'    % valve stuck
                X(12) = 0;      % v_fcv = 0
    
        end
    end
end

