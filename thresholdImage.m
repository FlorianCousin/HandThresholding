function It = thresholdImage(I, likeSkin, likeBack, aprioriSkin, aprioriBack)

% This function computes the threshold of an image according to the maximum
% aposteriori probability.
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

It = false(m, n);

for i = 1:m
    for j = 1:n
        pixel = I(i, j, :);
        state = thresholdPixel(pixel(:), likeSkin, likeBack, aprioriSkin, aprioriBack);
        if strcmp(state, 'skin')
            It(i, j) = true;
        end
    end
end

end