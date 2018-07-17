%% Performs filtering task for ground robot using async PF.

clc;
events = importdata('ground_robot_data.txt');

M = 1000;

f_mm = @measurement_model_ground2;
f_init = @init_particles_ground2;
f_tm = @transition_model_ground_1b;
params = params_ground();
filtered = async_particle_filter(events,3,M,f_tm,f_mm,f_init,params);

x = filtered(:,1);
y = filtered(:,2);
[gpsx, gpsy] = get_gps(events);
moves_data = load('robot_moves.txt');
x_real = moves_data(:,1);
y_real = moves_data(:,2);
figure;
plot(x_real,y_real,gpsx,gpsy,x,y);
legend('Real','GPS','Filtered');

err = mean(sqrt((x - x_real).^2 + (y - y_real).^2));
fprintf('Err: %4.2f\n', err);