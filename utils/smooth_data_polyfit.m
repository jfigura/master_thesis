function smoothed = smooth_data_polyfit(data, degree, show_plot, plot_title)

%% Smooths data by fitting a polynomial of given degree
%% Divides the data to parts of size dx = 400, fits a polynomial to each part

N = size(data,1);
dx = 400; 
smoothed = zeros(N,1);

for i=1:ceil(N/dx)
    from = 1 + (i-1)*dx;
    to = min(from + dx -1 ,N);
    x = from:to;
    y = data(x);
    p = polyfit(x',y,degree);
    sm = polyval(p,x);
    smoothed(x) = sm';
end


if show_plot  
    figure
    plot(1:N,data);
    hold all;
    plot(1:N,smoothed,'LineWidth',3);
    legend('original data','smoothed data');
    title(plot_title)
end
