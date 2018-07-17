function W = measurement_model_task_I(z,X,params)
    %% Parameters of sensor errors
    sigma_pitch = 0.1;
    sigma_xdot = 0.1;
    sigma_x = 0.04;
    
    pitch_precision = 0.01;
    x_precision = 0.01;
    xdot_precision = 0.00001;
    
    % X columns are particles
    
    [pitch_i,xdot_i,x_i] = get_state_indexes_task_I();
    [pitch_m_i, xdot_m_i,x_m_i] = get_measurement_indexes_task_I();
    
    p_pitch = gaussian_probability(z(1,pitch_m_i), X(:,pitch_i), sigma_pitch,pitch_precision);
    p_xdot = gaussian_probability(z(1,xdot_m_i), X(:,xdot_i), sigma_xdot,x_precision);
    p_x = gaussian_probability(z(1,x_m_i), X(:,x_i), sigma_x,xdot_precision);
    
    W = p_xdot .* p_pitch .* p_x;