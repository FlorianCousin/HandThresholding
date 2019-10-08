function updateBackgroundData(images)

% Updates the collected data of the pixels of the background.
%
% Input
% images: string array of the images to consider in the update. The images
%   with no data yet are always considered first. The '.jpg' is not
%   included in the names.

if nargin < 1
    files = dir('dataset/training/*.jpg');
    images = string(zeros(1, numel(files)));
    
    for i = 1:numel(files)
        images(i) = convertCharsToStrings(regexprep(files(i).name, '.jpg', ''));
    end
end

if isfile('dataset/training/backPixels.mat')
    % backPixels is a struct. The fields of backPixels are the names of the
    % treated images without '.jpg' and with a f at the beginning
    data = load('dataset/training/backPixels.mat', 'backPixels');
    
    if isfield(data, 'backPixels')
        backPixels = data.backPixels;
    else
        backPixels = struct();
    end
else
    backPixels = struct();
end

alreadySeen = string(zeros(1, length(images)));
alreadySeenInd = 1;

% We first compute alle the images that has no data yet
for i = 1:length(images)
    fileName = char(images(i));
    
    if isfield(backPixels, strcat('f', fileName))
        alreadySeen(alreadySeenInd) = convertCharsToStrings(fileName);
        alreadySeenInd = alreadySeenInd + 1;
        continue
    end
    
    backPixels.(strcat('f', fileName)) = cropAndLin(strcat('dataset/training/', fileName, '.jpg'));
    
    save('dataset/training/backPixels.mat', 'backPixels');
end

% We then compute the image with data yet and we overwrite the data
for i = 1:length(alreadySeen)
    fileName = char(alreadySeen(i));
    
    % If fileName is equal to '0', it means there is no more images to deal
    % with
    if strcmp(fileName, '0')
        break
    end
    
    backPixels.(strcat('f', fileName)) = cropAndLin(strcat('dataset/training/', fileName, '.jpg'));
    
    save('dataset/training/backPixels.mat', 'backPixels');
end

end