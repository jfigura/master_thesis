function X = init_particles_general(z,n,M)
    %% Initializes particles I with Gaussian distribution around the first measured value if available.
    X = zeros(M,n);
    for i=1:n
        if ~isnan(z(i))
            X(:,i) = z(i) + 0.1 * randn(M,1);
        else
            X(:,i) = 2 * rand(M,1) - 1;
        end
    end