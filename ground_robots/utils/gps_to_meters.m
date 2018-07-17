function [x,y] = gps_to_meters(gpsLat,gpsLon)
    %%Transforms GPS position to our coordinate system in meters with a
    %%fixed origin
    originX = 50.6706;
    originY = 14.0752;
    
    [x,y,sf] = mercator([originY, gpsLon],[originX, gpsLat]);
    meanSF = mean(sf);
    x_km=x*6378.1/meanSF;
    y_km=y*6378.1/meanSF;
    x = 1000 * (x_km(1,2) - x_km(1,1));
    y = 1000 * (y_km(1,2) - y_km(1,1));