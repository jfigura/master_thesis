function X_new = transition_model_ground(event,X,params)
    %% This model adds noise to final position in case control signals are nonzero, does not add any noise otherwise

    M = size(X,1);

    alpha = event(1,2);
    dist = event(1,4);
    beta = event(1,6);
    
    if dist > 0
        X_new(:,1) = X(:,1) + cos(X(:,3) + alpha) * dist + randn(M,1) * 0.05;
        X_new(:,2) = X(:,2) + sin(X(:,3) + alpha) * dist + randn(M,1) * 0.05;
    else 
        X_new(:,1:2) = X(:,1:2);
    end
    
    if alpha + beta ~= 0 
        X_new(:,3) = mod(X(:,3) + (alpha + beta) + randn(M,1) * 0.001, 2*pi);
    else
        X_new(:,3) = X(:,3);
    end