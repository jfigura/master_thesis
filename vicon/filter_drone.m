function filtered_drone = filter_drone(drone, time_match_err_threshold)
%% Returns records that are valid and time-matched better than time_match_err_threshold
    valid_data_size = size(find(drone(:,7)),1);
    %filter for valid records
    drone = drone(drone(:,7) == 1, :);

    %filter for time matched records
    time_match_error = zeros(valid_data_size,1);
    for i=1:valid_data_size
        dist_a = abs(drone(i,2) - drone(i,1));
        dist_b = abs(drone(i,3) - drone(i,1));
        time_match_error(i) = max(dist_a,dist_b);
    end
    filtered_drone = drone(time_match_error(:,1) < time_match_err_threshold, :);