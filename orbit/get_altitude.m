function h = get_altitude(X, par)   
    P = get_R(X);
    
    a = par.Ra;
    b = par.Ra;
    c = par.Rb;
    
    F = @(X) [X(1)*(1+X(4)/a^2)-P(1);
              X(2)*(1+X(4)/b^2)-P(2);
              X(3)*(1+X(4)/c^2)-P(3);
              (X(1)/a)^2+(X(2)/b)^2+(X(3)/c)^2-1];
      
    dF = @(X) [1+X(4)/a^2, 0, 0, X(1)/a^2;
               0, 1+X(4)/b^2, 0, X(2)/b^2;
               0, 0, 1+X(4)/c^2, X(3)/c^2;
               2*X(1)/a^2, 2*X(2)/b^2, 2*X(3)/c^2, 0];
          
    x0 = P/norm(P) .* [a; b; c];
    k = 0;
    X0 = [x0; k];
    
    [X, ~] = newton(F, dF, X0, par.tol, 1000, false);
    h = norm(P-X(1:3));
end

