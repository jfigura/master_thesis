function prob = transition_probability_task_I(u,X,X_new,params)
    X_new_deterministic = transition_deterministic_task_I(u,X);
    [sigma_pitch, sigma_xdot, sigma_x] = get_transition_sigmas_task_I();
    [pitch_i, xdot_i,x_i] = get_state_indexes_task_I();
    
    prob = gaussian_probability(X_new(:,pitch_i),X_new_deterministic(:,pitch_i),sigma_pitch,0.0001);
    prob = prob .* gaussian_probability(X_new(:,xdot_i),X_new_deterministic(:,xdot_i),sigma_xdot,0.0001);
    prob = prob .* gaussian_probability(X_new(:,x_i),X_new_deterministic(:,x_i),sigma_x,0.0001);