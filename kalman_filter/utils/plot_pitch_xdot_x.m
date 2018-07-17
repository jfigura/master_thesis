function [] = plot_pitch_xdot_x(predicted, data, titles)

if nargin < 3
    titles = {'pitch estimation', ...
        'xdot estimation', ...
        'x estimation'};
end


xplot = 1:size(data,1);

for i=1:size(predicted,2)
    figure;
    plot(xplot,predicted(:,i),'LineWidth',2);
    hold all;
    plot(xplot,data(:,i));
    legend('Estimation','Measured');
    title(titles{i});
end