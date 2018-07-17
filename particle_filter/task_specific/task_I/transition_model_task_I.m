function X_new = transition_model_task_I(u,X,params)
    M = size(X,1);
    [sigma_pitch, sigma_xdot, sigma_x] = get_transition_sigmas_task_I();
    
    [pitch_i,xdot_i,x_i] = get_state_indexes_task_I();
    
    X_new = transition_deterministic_task_I(u,X);
    X_new(:,pitch_i) = X_new(:,pitch_i) + sigma_pitch * randn(M,1);
    X_new(:,xdot_i) = X_new(:,xdot_i) + sigma_xdot * randn(M,1);
    X_new(:,x_i) = X_new(:,x_i) + sigma_x * randn(M,1);