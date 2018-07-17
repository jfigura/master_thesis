function [pitch_pred, xdot_pred, X_tskI] = filter_pf_all(params, test_data)
    [pitch,xdot,elevator] = parse_data(test_data);
    
    f_mm = @measurement_model_general;
    f_tp = @transition_probability_general;
    f_init = @init_particles_general;
    f_tm = @transition_model_general;
    
    Z = [pitch xdot elevator];
    u = ones(size(Z,1),1);
    M = 2000;
    
    %% Task I
    [X_tskI, ~, ~, ~, ~] = particle_filter(Z,u,3,M,f_tm,f_mm,f_tp,f_init,params,false);
    X_tskI = X_tskI(:,1:2)';
    
    %% Task IIa
    Z = [pitch xdot elevator];
    Z(:,1) = NaN;
    [filtered, ~, ~, ~, ~] = particle_filter(Z,u,3,M,f_tm,f_mm,f_tp,f_init,params,false);
    pitch_pred = filtered(:,1)';
    
    %% Task IIb
    
    Z = [pitch xdot elevator];
    Z(:,2) = NaN;
    [filtered, ~, ~, ~, ~] = particle_filter(Z,u,3,M,f_tm,f_mm,f_tp,f_init,params,false);
    xdot_pred = filtered(:,2)';