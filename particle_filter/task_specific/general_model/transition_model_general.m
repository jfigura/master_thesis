function X_new = transition_model_general(u,X,params)
    %% Performs transition model deterministically, then adds noise.
    M = size(X,1);
    sigmas = params{5};
    X_new = transition_deterministic_general(X,params);
    
    for i=1:size(sigmas,1)
       X_new(:,i) = X_new(:,i) + sigmas(i) * randn(M,1);
    end