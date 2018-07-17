function filtered = async_particle_filter(events,n,M,transition_model,...
                                            measurement_model,init_particles,params)
    %% Performs asynchronous Particle filter (records are NOT required to contain all measurements and control signals,
    % each time step in events contains a single type of measurement or
    % control signal
    % Z = measurements, u = control signals
    % n = state vector size
    % M = number of particles
    % outputs filtered predictions for each time record of control signals
   
    N = size(events,1);
    filtered = zeros(N,n);
    
    X = init_particles(M,n);
    W = ones(M,1) / M;
    
    j = 1;
    
    for i=1:N
        [X,W] = async_particle_filter_step(X, W, events(i,:), ...
            transition_model, measurement_model,params);
        if events(i,1) == 1
            filtered(j,:) = predict_from_particles(X, W);
            j = j + 1;
        end
    end
    
    filtered(j:N,:) = [];