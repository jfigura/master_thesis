function X_new = transition_model_ground2(event,X,params)
    %% This model adds noise to control signals instead of adding noise to final position

    M = size(X,1);

    alpha = event(1,2);
    dist = event(1,4);
    beta = event(1,6);

    if dist > 0
        dist = dist + randn(M,1) * 0.02;
    end
    if alpha ~= 0
        alpha = alpha * 0.85 + randn(M,1) * 0.002;
    end
    if beta ~= 0
        beta = beta + randn(M,1) * 0.002;
    end
    
    X_new(:,1) = X(:,1) + cos(X(:,3) + alpha) .* dist;
    X_new(:,2) = X(:,2) + sin(X(:,3) + alpha) .* dist;
    
    X_new(:,3) = mod(X(:,3) + alpha + beta, 2*pi);