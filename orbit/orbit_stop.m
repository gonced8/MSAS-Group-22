function [position,isterminal,direction] = orbit_stop(t, X, ~, par)
    a = X(1);
    e = X(2);
    i = X(3);
    
    R = get_R(X);
    r = norm(R);
    v = sqrt(2*par.u*(1/r-1/(2*a)));

    % Stop with altitude and singularities
    position =[(R(1)/par.Ra)^2+(R(2)/par.Ra)^2+(R(3)/par.Rb)^2-1;
               v;
               i;
               i-pi;
               e];
               
    isterminal = ones(size(position));  % Halt integration 
    direction = [-1;
                 0;
                 0;
                 0;
                 0];
end