function [eigval] = lin_model(x_rc, data)
        
    J = jacob(@model, x_rc, data);
    eigval = eig(J);
end
