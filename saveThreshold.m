function saveThreshold(I, It, fileName)

% Saves an image and its thresholded version.
%
% Input
% I: original rgb image
% It: thresholded version of I
% fileName: original name of the image

imwrite(I, strcat('dataset/threshold/', fileName, '.png'));
imwrite(It, strcat('dataset/threshold/', fileName, 'binary.png'));
imwrite(I .* It, strcat('dataset/threshold/', fileName, 'hand.png'));

end