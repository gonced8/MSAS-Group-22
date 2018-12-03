function f = pressure_force(x, p_star, As)
    if x>0
        f = p_star*As;
    else
        f = 0;
    end
end

