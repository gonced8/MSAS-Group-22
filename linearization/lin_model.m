function [eigval] = lin_model(f, x_rc, data)
        
    J = jacob(f, x_rc, data);
    eigval = eig(J);
end
