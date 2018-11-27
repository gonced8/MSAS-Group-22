function [position,isterminal,direction] = orbit_stop(t, X, par)
    R = get_R(X);
    
    position = (R(1)/par.Ra)^2+(R(2)/par.Ra)^2+(R(3)/par.Rb)^2-1;
    isterminal = 1;  % Halt integration 
    direction = -1;
end