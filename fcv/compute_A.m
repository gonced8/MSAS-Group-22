function A = compute_A(x, d0)
    if x<0
        A=0;
    else
        alpha = 2*acos(1-2*x/d0);
        A = d0^2*(alpha-sin(alpha))/8;
    end
end