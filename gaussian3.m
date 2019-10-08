function y = gaussian3(x, mu, sigma)

% Return the gaussian function of mean mu and standard deviantion sigma
% evaluated in x.
%
% Input
% x: 3 dimensional column vetor where the gaussian should be evaluated
% mu: 3 dimensional column vector to consider in the gaussian function
% sigma: 3 by 3 matrix which is the covariance matrix of the gaussian
%
% Output
% y: 3 dimensional column vector which the evaluation of the gaussian in x

coeff = 1 / sqrt(8 * pi^3 * det(sigma));

y = coeff * exp(- sum(((x - mu)' / sigma)' .* (x - mu), 1) / 2);

end