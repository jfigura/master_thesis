function [x,y] = get_gps(events)

gpsx = events(:,8);
nonzerogpsx  = gpsx(gpsx ~= 0);
gpsy = events(:,9);
nonzerogpsy  = gpsy(gpsy ~= 0);

N = size(nonzerogpsx,1);
x = zeros(N);
y = zeros(N);

for i=1:N
    [x(i),y(i)] = gps_to_meters(nonzerogpsx(i),nonzerogpsy(i));
end