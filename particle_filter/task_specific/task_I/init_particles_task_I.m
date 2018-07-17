function X = init_particles_task_I(z,n,M)
    %% Initializes particles for task I with Gaussian distribution around the first measured value.
    X = ones(M,n);
    for i=1:M
        X(i,:) = z + randn(1,n);
    end