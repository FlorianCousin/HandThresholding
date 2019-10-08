function [mu, sigma] = getGaussianEstimate(data)

% This function returns the gaussian estimate of the data.
%
% Input
% data: 3 by n array of rgb pixels
%
% Output
% mu: 3 dimensional column vector which is the mean of the pixels
% sigma2: 3 by 3 matrix which is the covariance matrix of the pixels

mu = mean(data, 2);

sigma = cov(data');

end