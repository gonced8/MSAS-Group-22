function f = pressure_force(x, data)
    if x>0
        f = data.p_star*data.width*data.depth;
    else
        f = data.p0*data.width*data.depth/2;
    end
end

