function [position, isterminal, direction] = eventfcn(~, X, data)
    x_acc = X(7);        % position of the mass in the accelerometer
    x_fcv = X(11);       % position of the spool
    
    position = [x_acc-data.accel.g; x_acc+data.accel.g; x_fcv-data.fcv.d];
    isterminal = [1; 1; 1];
    direction = [1; -1; 1]; 
end

