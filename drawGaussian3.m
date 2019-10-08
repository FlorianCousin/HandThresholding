function drawGaussian3(mu, sigma, numPoints)

% Draw a multivariate gaussian.
%
% Input
% mu: mean of the gaussian
% sigma: covariance matrix of the gaussian
% numPoints: numer of points drawn (default: 500)

if nargin < 3
    numPoints = 500;
end

P = mvnrnd(mu, sigma, numPoints);
scatter3(P(:, 1), P(:, 2), P(:, 3), '+');
xlabel('red'); ylabel('green'); zlabel('blue')

end