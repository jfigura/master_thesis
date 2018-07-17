function X = init_particles_ground2(M,n)
    %% Initializes around the real state
    X = ones(M,n);
    minX = -75;
    maxX = -65;
    minY = 75;
    maxY = 85;
    minComp = 0;
    maxComp = 2 * pi;
    
    X(:,1) = minX + (maxX-minX) * rand(M,1);
    X(:,2) = minY + (maxY-minY) * rand(M,1);
    X(:,3) = minComp + (maxComp-minComp) * rand(M,1);
    
        