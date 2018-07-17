function X_new = transition_deterministic_ground(alpha,dist,beta,X)
    
    X_new(:,1) = X(:,1) + cos(X(:,3) + alpha) * dist;
    X_new(:,2) = X(:,2) + sin(X(:,3) + alpha) * dist;
    X_new(:,3) = X(:,3) + alpha + beta;