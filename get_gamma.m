function gamma = get_gamma(theta, h, r, v)
    gamma = real(acos(h/(r*v)));
    
    if theta>pi && theta<=2*pi
        gamma = -gamma;
    end
end

