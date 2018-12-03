function aa = J2_perturbation(r, R, V, par)  
    a = [par.u/r^3*R(1)*(par.J2*3/2*(par.Ra/r)^2*(5*(R(3)/r)^2-1));
         par.u/r^3*R(2)*(par.J2*3/2*(par.Ra/r)^2*(5*(R(3)/r)^2-1));
         par.u/r^3*R(3)*(par.J2*3/2*(par.Ra/r)^2*(5*(R(3)/r)^2-3))];
    
    A = cartesian2kepler(R, V);
    
    aa = A*a;
end

