function state = thresholdPixel(pixel, likeSkin, likeBack, aprioriSkin, aprioriBack)

% Compute the threshold of a pixel according to the maximum aposteriori
% probability.
%
% Input
% pixel: 3 dimensional column vector to compute
% likeSkin: 1-parameter function which is the likelihood of the skin
% likeBack: 1-parameter function which is the likelihood of the background
% aprioriSkin: apriori probability of the skin
% aprioriBack: apriori probability of the background
%
% Output
% state: state that maximises the a posteriori probability

denominator = likeSkin(pixel) * aprioriSkin + likeBack(pixel) * aprioriBack;

aposterioriSkin = likeSkin(pixel) * aprioriSkin / denominator;

aposterioriBack = likeBack(pixel) * aprioriBack / denominator;

if aposterioriSkin > aposterioriBack
    state = 'skin';
else
    state = 'back';
end

end