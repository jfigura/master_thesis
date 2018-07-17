function [pitch,roll,elevator,aileron,throttle,x,y,yaw,x_dot,y_dot,z,time] = get_data_indexes()
    %% Returns the indexes of columns in original data
    pitch = 1;
    roll = 2;
    elevator = 3;
    aileron = 4;
    throttle = 5;
    x = 6;
    y = 7;
    yaw = 8;
    x_dot = 9;
    y_dot = 10;
    z = 11;
    time = 12;
    