function [X_result, W_result] = particle_filter_step(X, W, u, z, transition_model, ...
                                                    measurement_model, transition_prob,params)
    %% Performs one step of SIR Particle filter.
    % u is row vector of control signals
    % z is row vector of measurement
    % W and transition_prob are not used in SIR PF
    
    X_new = transition_model(u,X,params);
    W_result = measurement_model(z,X_new,params);
        
    [X_result,W_result] = resample(X_new,W_result);
    W_result = W_result / sum(W_result); %normalize
   