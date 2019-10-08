function threshold(estimateSkin, estimateBack, aprioriSkin, aprioriBack, images)

% This function thresholds some images and saves them in the threshold
% folder of the dataset
%
% Input
% estimateSkin: the method used to estimate the likelihood of the skin
%   (default: 'gaussian') (either 'gaussian or 'kernel')
% estimateBack: the method used to estimate the likelihood of the
%   background (default: 'gaussian') (either 'gaussian or 'kernel')
% aprioriSkin: apriori probability of the skin (default: 0.5)
% aprioriBack: apriori probability of the background (default: 0.5)
% images: string array representing the images to threshold (only the name
%   without '.jpg') (default: all the images of the test folder of the
%   dataset)

if nargin < 1
    estimateSkin = 'gaussian';
end
if nargin < 2
    estimateBack = 'gaussian';
end
if nargin < 3
    aprioriSkin = 0.5;
end
if nargin < 4
    aprioriBack = 0.5;
end
if nargin < 5
    files = dir('dataset/test/*.jpg');
    images = string(zeros(1, numel(files)));
    
    for i = 1:numel(files)
        images(i) = convertCharsToStrings(regexprep(files(i).name, '.jpg', ''));
    end
end

skinPixels = getLinPixels('skin');
backPixels = getLinPixels('back');

% Definition of the likelihood of the skin
switch estimateSkin
    case 'gaussian'
        [mu, sigma] = getGaussianEstimate(skinPixels);
        likeSkin = @(x) gaussian3(x, mu, sigma);
    case 'kernel'
        sampleDataSize = 100;
        step = floor(size(skinPixels, 2) / sampleDataSize);
        likeSkin = @(x) mvksdensity(backPixels(:, 1:step:end)', x', 'Bandwidth', 0.05)';
    otherwise
        error('No such method available for the skin estimation')
end

% Definition of the likelihood of the background
switch estimateBack
    case 'gaussian'
        [mu, sigma] = getGaussianEstimate(backPixels);
        likeBack = @(x) gaussian3(x, mu, sigma);
    case 'kernel'
        sampleDataSize = 100;
        step = floor(size(backPixels, 2) / sampleDataSize);
        likeBack = @(x) mvksdensity(backPixels(:, 1:step:end)', x', 'Bandwidth', 0.05)';
    otherwise
        error('No such method available for the background estimation')
end

% Thresholding
for i = 1:length(images)
    fileName = char(images(i));
    
    I = double(imread(strcat('dataset/test/', fileName, '.jpg'))) / 255;
    
    It = thresholdImageFast(I, likeSkin, likeBack, aprioriSkin, aprioriBack);
    
    saveThreshold(I, It, fileName)
end

end