function f = pressure_force(x, data)
    if x>0
        f = data.xenon.p_star*data.As;
    else
        f = 0;
    end
end

