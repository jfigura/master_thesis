function W = measurement_model_ground(event,X,params)
   %% Uses different compass error variations for different measurement values.

   M = size(X,1);
   W = ones(M,1);
   if event(1,1) == 3 %ak je typ eventu gps:
       %vezmi gpsX, gpsY z event
       gpsLat = event(1,8);
       gpsLon = event(1,9);
       %preved to na nase suradnice
       [x,y] = gps_to_meters(gpsLat,gpsLon);
       %spocitaj pravdep. merania
       x_p = gaussian_probability(X(:,1),x,5,1);
       y_p = gaussian_probability(X(:,2),y,5,1);
       W = x_p .* y_p; 
       
   end
   if event(1,1) == 2 %compass
       compass = mod(event(1,11),2*pi);
       for i=1:M
           state_angle = X(i,3);
           offset = -0.5;
           if state_angle >= 3.5 && state_angle < 4.5
               offset = 0.25;
           elseif state_angle >= 4.5 && state_angle < 6
               offset = -0.25;
           elseif state_angle >= 6 || state_angle < mod(7,2*pi)
               offset = -0.75;
           elseif state_angle >= mod(7, 2*pi) && state_angle < mod(7.5,2*pi)
               offset = -0.9;
           elseif state_angle >= mod(7.5, 2*pi) && state_angle < mod(8.5,2*pi)
               offset = -1.25;
           end
           mean_angle = mod(state_angle + offset, 2*pi);
           angle_err = angle_dist(mean_angle,compass);
           W(i) = gaussian_probability(angle_err,0,1,0.001);
       end
   end