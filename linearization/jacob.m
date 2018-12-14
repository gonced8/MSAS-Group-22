function jacobian = jacob(f, x0, data)
    dim = length(f(0,x0,data));                        
    n_var = length(x0);                     
    jacobian = zeros(dim,n_var);
    
    % The epsilon_vect is build anew for each variable in order to
    % compute the partial derivatives one at a time
    % also, the partial derivative is done at the same iteration for
    % every "line function"

    for j = 1:n_var
        epsilon = max(sqrt(eps),sqrt(eps)*abs(x0(j)));
        epsilon_vect = zeros(n_var,1);
        epsilon_vect(j,1) = epsilon;
        aux1 = f(0,x0 + epsilon_vect,data);
        aux2 = f(0,x0 - epsilon_vect,data);
        jacobian(:,j) = (aux1 - aux2)/(2*epsilon);
    end

end
