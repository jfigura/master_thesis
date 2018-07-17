 function [pitch_pred, xdot_pred, X_tskI] = filter_exponential(params, test_data)
 
    %% Performs exponential filter with learnt parameters
 
    [pitch,xdot,elevator] = parse_data(test_data);
    A = params{1};
    p0 = A(1,3);
    p1 = A(1,1);
    p2 = A(2,1);
    p3 = A(2,2);
    
    N = size(pitch,1);
    
    filtered_pitch = zeros(N,1);
    filtered_pitch(1) = pitch(1);
    
    filtered_xdot = zeros(N,1);
    filtered_xdot(1) = xdot(1);
    
    alpha = 0.95;
    for i=2:N
        filtered_pitch(i) = alpha * (p1 * filtered_pitch(i-1) + p0 * elevator(i-1)) + (1-alpha) * pitch(i);
        filtered_xdot(i) = alpha * (p3 * filtered_xdot(i-1) + p2 * pitch(i-1)) + (1-alpha) * xdot(i);
    end
    
    pitch_pred = NaN; %Exponential filter cannot make predictions
    xdot_pred = NaN;
    X_tskI = [filtered_pitch'; filtered_xdot'];
    