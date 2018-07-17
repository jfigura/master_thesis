function [filtered, smoothed,Xs,Ws,Wss] = particle_filter(Z,u,n,M,transition_model,...
                                            measurement_model,transition_prob,init_particles,params,do_smooth)
    %% Performs Particle filter or smoother
    % Z = measurements, u = control signals
    % n = state vector size
    % M = number of particles
    % outputs filtered and smoothed predictions, Xs..particles for each time,
    % Ws..filtered weights for each time, Wss..smoothed weights for each time

    T = size(u,1);
    filtered = zeros(T,n);
    if do_smooth
        smoothed = zeros(T,n);
        Xs = zeros(M,n,T);
        Ws = zeros(M,T);
        Wss = zeros(M,T);
    else % in order to save memory, do not allocate the matrices when not smoothing
        smoothed = NaN;
        Xs = NaN;
        Ws = NaN;
        Wss = NaN;
    end
    
    X = init_particles(Z(1,:),n,M);
    W = ones(M,1);
    
    for i=1:T
        [X,W] = particle_filter_step(X, W, u(i,:), Z(i,:),...
            transition_model, measurement_model,transition_prob,params);
        filtered(i,:) = predict_from_particles(X, W);
        if do_smooth
            Xs(:,:,i) = X;
            Ws(:,i) = W;
        end
    end
    
    if do_smooth
        Wss(:,T) = Ws(:,T);
        smoothed(T,:) = filtered(T,:);
        for i=T-1:-1:1
            Wss(:,i) = smooth_weights(Ws(:,i),Wss(:,i+1),Xs(:,:,i),Xs(:,:,i+1),transition_prob,u(i,:),params);
            smoothed(i,:) = predict_from_particles(Xs(:,:,i),Wss(:,i));
        end
    end
    
    