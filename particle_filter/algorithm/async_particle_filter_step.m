function [X_result, W_result] = async_particle_filter_step(X, W, event, transition_model, ...
                                                    measurement_model, params)
    %% Performs one step of async particle filter.
   
    if event(1,1) == 1 %transition
            X_result = transition_model(event,X,params);
            W_result = W;
    else %measurement
            W = measurement_model(event,X,params);
            [X_result,W_result] = resample(X,W);
    end
    
    