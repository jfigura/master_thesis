%% Creates the plots of Vicon data

clc;
format compact
drone1_all = load('processed1.txt');
drone2_all = load('processed2.txt');
drone3_all = load('processed3.txt');

time_match_treshold = 500;

drone1 = filter_drone(drone1_all, time_match_treshold);
drone2 = filter_drone(drone2_all, time_match_treshold);
drone3 = filter_drone(drone3_all, time_match_treshold);

distance_graph(drone1, 'Drone 1');
distance_graph(drone2, 'Drone 2');
distance_graph(drone3, 'Drone 3');