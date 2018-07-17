%% Run particle filter for Task I

clc;
data = load_and_prepare_data();
[pitch_i,roll_i,elevator_i,aileron_i,throttle_i,x_i,y_i,yaw_i,xdot_i,y_dot_i,z_i,time_i] = get_data_indexes();

M = 1000;
from = 1600;
to = 2400;
data = data(from:to,:);

Z = data(:,[pitch_i,xdot_i,x_i]);
u = data(:,elevator_i);
f_mm = @measurement_model_task_I;
f_tp = @transition_probability_task_I;
f_init = @init_particles_task_I;
f_tm = @transition_model_task_I;

[filtered, smoothed,Xs,Ws,Wss] = particle_filter(Z,u,3,M,f_tm,f_mm,f_tp,f_init,0,false);

plot_pitch_xdot_x(filtered, data(:,[pitch_i, xdot_i,x_i]));