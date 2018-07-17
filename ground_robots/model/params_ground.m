function params = params_ground()
    transition_params = 1;
    transition_sigmas = [0.1;0.1;0.5];
    gps_covariance = [30 0; 0 30];
    params = {transition_params, transition_sigmas, gps_covariance};