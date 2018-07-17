%% Runs simple filtering task using Kalman filter
% Input: pitch, xdot, x, elevator
% Output: pitch, xdot, x

data = load_and_prepare_data();
from = 800;
to = 1800;
data = data(from:to,:);

% Run Kalman fitler with default parameters
[Z,A,H,Q,R,P,x] = get_kalman_input_task_I(data);
[X_apr,X_post,X_smooth,P_post,P_smooth,L] = kalman_filter(Z,A,H,Q,R,P,x,true);

print_likelihood(X_apr,X_post,X_smooth,Z,P_smooth,A,H,Q,R,L);
plot_pitch_xdot_x(X_post([1 2 4],1:1000)', data(1:1000,[1,9,6]));