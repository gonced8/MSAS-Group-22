function v = correct_v(v, x, d0)
    if (x<=0 && v<0) || (x>=d0 && v>0)
        v=0;
    end
end