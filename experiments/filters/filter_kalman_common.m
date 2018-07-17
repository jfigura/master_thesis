function [pitch_pred, xdot_pred, task_I] = filter_kalman_common(params, test_data,get_prior)
    [pitch,xdot,elevator] = parse_data(test_data);
    A = params{1};
    H = params{2};
    Q = params{3};
    R = params{4};
    [x_prior, P] = get_prior();

    %% Task I
    Z = [pitch xdot elevator]';
    [~,X,~,~,~,~] = kalman_filter(Z,A,H,Q,R,P,x_prior,false);
    task_I = X([1 2],:);
    
    %% Task IIa
    H_IIa = H;
    H_IIa(1,:) = [];
    R_IIa = R;
    R_IIa(1,:) = [];
    R_IIa(:,1) = [];
    Z_IIa = [xdot elevator]';
    [~,X_post,~,~,~,~] = kalman_filter(Z_IIa,A,H_IIa,Q,R_IIa,P,x_prior,false);
    pitch_pred = X_post(1,:);
    
    %% Task IIb
    
    H_IIb = H;
    H_IIb(2,:) = [];
    R_IIb = R;
    R_IIb(2,:) = [];
    R_IIb(:,2) = [];
    Z_IIb = [pitch elevator]';
    [~,X_post,~,~,~,~] = kalman_filter(Z_IIb,A,H_IIb,Q,R_IIb,P,x_prior,false);
    xdot_pred = X_post(2,:);