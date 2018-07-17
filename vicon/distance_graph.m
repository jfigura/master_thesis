function [] = distance_graph(drone, plot_title)
    t = drone(:,1);
    dist_a = drone(:,5);
    dist_b = drone(:,6);
    dist_estimated = drone(:,4);
    
    figure;
    plot(t,dist_a,t,dist_b);
    hold all;
    plot(t,dist_estimated,'r.', 'MarkerSize', 2);
    legend('robot A','robot B','estimated dist');
    grid on;
    title(plot_title)
    hold off;