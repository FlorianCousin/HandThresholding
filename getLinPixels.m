function pixels = getLinPixels(state)

% Returns the pixels considered to compute the state likelihood
%
% Input
% state: 'skin' or 'back'
%
% Output
% pixels: 3 by n array of the pixels we are sure they are in the state
%   state because they have been selected by updateSkinData or
%   updateBackgroundData functions.

if ~strcmp(state, 'skin') && ~strcmp(state, 'back')
    error('Invalid input')
end
    

field = strcat(state, 'Pixels');

data = load(strcat('dataset/training/', field, '.mat'), field);

pixelsStruct = data.(field);

images = fieldnames(pixelsStruct);

% Calculation of the number of pixels
num = 0;
for i = 1:length(images)
    num = num + size(pixelsStruct.(images{i}), 2);
end

% Initialisation
pixels = zeros(3, num);
pixelsInd = 1;

for i = 1:length(images)
    for j = 1:size(pixelsStruct.(images{i}), 2)
        pixels(:, pixelsInd) = pixelsStruct.(images{i})(:, j);
        pixelsInd = pixelsInd + 1;
    end
end

end