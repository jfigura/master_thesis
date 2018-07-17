function d = angle_dist(alpha, beta)
    min_angle = min(alpha,beta);
    max_angle = max(alpha,beta);
    d = min(max_angle - min_angle, 2*pi + min_angle - max_angle);