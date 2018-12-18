function hl = get_stability_boundary(a, b, n)
    if isempty(n)
        n = 100;
    end
    
    z = linspace(0, 2*pi, n);
    z = exp(1i*z);
    
    k = length(a);
    
    zk = zeros(k, n);
    zk(1, :) = ones(size(1, n));
    for i = 2:k
       zk(i, :) = zk(i-1, :).*z;
    end
    
    hl = (a*zk)./(b*zk);
end