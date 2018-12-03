function x = correct_x(x, d0)
    if x<0
        x=0;
    elseif x>d0
        x=d0;
    end
end
