function p = gaussian_probability(value, mu, sigma, precision)
%% Helper function for a probability of a value in normal distribution with mean mu and sigma variance

 p = normcdf(value + precision / 2, mu, sigma) - normcdf(value - precision / 2, mu, sigma);