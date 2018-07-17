function W = measurement_model_ground2(event,X,params)
   M = size(X,1);
   W = ones(M,1);
   if event(1,1) == 3 %if event type is gps:
       %take gpsX, gpsY from event
       gpsLat = event(1,8);
       gpsLon = event(1,9);
       %transform to our coordinates
       [x,y] = gps_to_meters(gpsLat,gpsLon);
       %calculate measurement probability
       x_p = gaussian_probability(X(:,1),x,5,1);
       y_p = gaussian_probability(X(:,2),y,5,1);
       W = x_p .* y_p; 
       
   end
   if event(1,1) == 2 %is event type is compass
       state = mod(X(:,3) - 0.5, 2*pi);
       comp = mod(event(1,11),2*pi);
       min_comp = min(comp,state);
       max_comp = max(comp,state);
       comp_err = min(max_comp - min_comp, min_comp + 2*pi - max_comp);
       W = gaussian_probability(comp_err,0,1,0.001);

   end