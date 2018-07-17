function X_new = transition_model_ground_1b(event,X,params)
    %% Adds noise to the final position. Variance of noise is dependant on the distance (from control signals)
    % and its square. The dependency coefficients are calculated in
    % analyze/analyze_transition_1.
    M = size(X,1);

    alpha = event(1,2);
    dist = event(1,4);
    beta = event(1,6);
    
    estim_x_err = [dist dist.^2] * [0.2753; 0.4877];
    estim_y_err = [dist dist.^2] * [0.1017; 0.6961];
    estim_angle_err = [dist abs(alpha + beta)] * [0.0568; 0.4484];
    
    X_new(:,1) = X(:,1) + cos(X(:,3) + alpha) * dist + randn(M,1) * estim_x_err * 5;
    X_new(:,2) = X(:,2) + sin(X(:,3) + alpha) * dist + randn(M,1) * estim_y_err * 5;
    X_new(:,3) = mod(X(:,3) + (alpha + beta) + randn(M,1) * estim_angle_err / 6, 2*pi);
    