function [Z,A,H,Q,R,P,x] = get_kalman_input_task_I(data)
    %% Creates input for Kalman filter for the setting with measured angle, speed and position - x axis
    % State vector: pitch, xdot, elevator, x
    % Measurements: pitch, xdot, elevator, x
    [pitch_i,~,elevator_i,~,~,x_i,~,~,x_dot_i,~,~,~] = get_data_indexes();
    
    c0 = 1; %xdot params
    c1 = 0.0296;
    k1 = 0.9722; %pitch params
    k2 = 0.0536;
    kx = -0.0154;

    sigma_pitch = 0.001;
    sigma_xdot = 0.001;
    sigma_elevator = 0.5;
    sigma_x = 0.001;
    m_sigma_pitch = 0.01;
    m_sigma_xdot = 0.01;
    m_sigma_elevator = 0.01;
    m_sigma_x = 0.01;

    A = [k1 0 k2 0; c1 c0 0 0; 0 0 1 0; 0 kx 0 1];
    H = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

    Q = [sigma_pitch 0 0 0; 0 sigma_xdot 0 0; 0 0 sigma_elevator 0; 0 0 0 sigma_x];
    R = [m_sigma_pitch 0 0 0; 0 m_sigma_xdot 0 0; 0 0 m_sigma_elevator 0; 0 0 0 m_sigma_x];

    Z = data(:,[pitch_i x_dot_i elevator_i x_i])';
    x = zeros(4,1);
    P = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
