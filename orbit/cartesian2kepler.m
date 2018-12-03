function A = cartesian2kepler(R, V)    
    h = cross(R, V);
    
    A = [V, cross(h, V), h];
    
    for k = 1:size(A, 2)
       A(:, k) =  A(:, k)/norm(A(:, k));
    end
    
    A = A.';
end

