function It = thresholdImageFast(I, likeSkin, likeBack, aprioriSkin, aprioriBack)

% This function computes the threshold of an image according to the maximum
% aposteriori probability but in a faster way than thresholdImage because
% it uses function array calls, i.e. it does not calculate for
% probabilities for each pixel but for every pixels.
%
% Input
% I: 3 channels image to compute
% likeSkin: 1-parameter function which is the likelihood of the skin
% likeBack: 1-parameter function which is the likelihood of the background
% aprioriSkin: apriori probability of the skin
% aprioriBack: apriori probability of the background
%
% Output
% It: the thresholded image of I

[m, n, ~] = size(I);

pixels = reshape(I, [], 3)';

likeSkinEst = likeSkin(pixels);
likeBackEst = likeBack(pixels);

denominator = likeSkinEst * aprioriSkin + likeBackEst * aprioriBack;

aposterioriSkin = likeSkinEst * aprioriSkin ./ denominator;

aposterioriBack = likeBackEst * aprioriBack ./ denominator;

Diff = aposterioriSkin - aposterioriBack;

Ilint = Diff > 0;

It = reshape(Ilint, m, n);

end