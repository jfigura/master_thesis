function X_new = transition_deterministic_task_I(u,X)
    c0 = 1; %xdot params
    c1 = 0.0296;
    k1 = 0.9722; %pitch params
    k2 = 0.0536;
    k3 = 0;
    kx = -0.0154;

    %%
    % X is particle matrix
    
    n = size(X,2); %state vector size
    M = size(X,1);
    [pitch_i,xdot_i,x_i] = get_state_indexes_task_I();
    elevator_i = get_control_signals_indexes_task_I();
    
    X_new = zeros(M,n);
    
    X_new(:,pitch_i) = k1 * X(:,pitch_i) + k2 * u(1,elevator_i) + k3 * X(:,xdot_i);
    X_new(:,xdot_i) = c0 * X(:,xdot_i) +  c1 * X(:,pitch_i);
    X_new(:,x_i) = X(:,x_i) +  kx * X(:,xdot_i);