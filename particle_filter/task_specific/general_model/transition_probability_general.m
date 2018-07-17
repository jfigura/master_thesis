function prob = transition_probability_general(u,X,X_new,params)
    X_new_deterministic = transition_deterministic_general(X,params);
    transition_sigmas = params{5};
    
    prob = 1;
    for i=1:size(transition_sigmas,1);
        prob = prob .* gaussian_probability(X_new(:,i),X_new_deterministic(:,i),transition_sigmas(i),0.00001);
    end