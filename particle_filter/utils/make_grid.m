function grid = make_grid(vals, n)
    if n == 1
        grid = vals';
    else
        grid = zeros(size(vals,2),n);
        p = 1;
        for i=vals
            rec_grid = make_grid(vals, n-1);
            k = size(rec_grid,1);
            grid(p:p+k-1,:) = [i*ones(k,1) rec_grid];
            p = p + k;
        end
    end