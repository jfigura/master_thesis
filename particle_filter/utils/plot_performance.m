function void = plot_performance(desired, predicted)
    
    rmse = compute_rmse(predicted,desired);
    fprintf('RMSE from data: %5.4f\n', rmse);
    
    N = size(predicted,1);
    figure;
    plot(1:N,predicted(:,[1 2]),1:N,desired(:,[1 2]));
    legend('pitch predicted','xdot predicted','pitch measured','xdot measured');
    