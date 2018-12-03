function [x, y] = newton(f, df, x0, tol, imax, show)
% Implementation of Newton's Method with derivative calculated numerically
% or analytically
% Input: function f, derivative df, initial guess x0,
% tolerance of the solution in the x axis tol, max number of iterartions
% imax, flag to show iterations
% Output: value of x at final iteration, f(x)=y

    start=tic;
    
    if ~isa(f, 'function_handle')
        f = matlabFunction(f, 'vars', {sym('x', size(x0))});
    end
    x = x0;
    y = f(x0);
    val = norm(y);
    
    if show
        fprintf('Newton''s method:\n')
        fprintf('Iteration: %d \t x = %s \t f(x) = %s \t |f(x)| = %d\n', 0, mat2str(x), mat2str(y), val)
    end
    
    if ~(val<tol)
        if (isempty(imax) || mod(imax, 1)~=0 || imax<1)  % check if imax exists, is integer and greater than 0
            imax=1000000;
        end
               
        for i = 1:imax       
            dy = derivative(f, df, x, y);
            %x_old = x;
            x = iteration(x, y, dy);
            y = f(x);
            val = norm(y);
            if show
                fprintf('Iteration: %d \t x = %s \t f(x) = %s \t |f(x)| = %d\n', ...
                        i, mat2str(x), mat2str(y), val)
            end
            %if abs(x-x_old)<tol
            if val<tol
                break;
            end
        end
    end

    if show
        toc(start)
    end
end

function x1 = iteration(x0, y0, dy0)
% Iterates the Newton's Method once
% Input: value of x at k x0, image of x at k y0, derivative at k dy0
% Output: new x at k+1

    x1 = x0 - dy0\y0;    
end

function D = derivative(f, df, x, y)
% Computes the derivative of a function at x. Can be done analytically or by
%           central finite differences
% Input: function f, derivative of f expression df (if empty, it calculates
%        the numerical derivative), value of x to calculate derivative, image in x
%       to get the dimensions straight)
% Output: Jacobian of f at x

    if isempty(df)  % finite diferences
        der = @(x, h) (f(x+h)-f(x-h))/(2*norm(h));  % central
        D = zeros(length(y), length(x));
        for j = 1:size(x)
            h = zeros(length(x), 1);    % disturbance
            h(j, 1) = max(sqrt(eps), x(j)*sqrt(eps));
            D(:, j) = der(x, h);    % calculates jacobian a column at a time
        end
    else    % analytical
        D = df(x);   % evaluates the analytical jacobian at x
    end
end
