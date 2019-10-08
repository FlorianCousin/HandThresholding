function pixels = cropAndLin(imageURL)

% Returns a list of pixels (a 3*n list) cropped by the user in the image
% given the imageURL

% Input
% imageURL: string or character array which is the URL of the image

I = double(imread(imageURL)) / 255;

Iskin = imcrop(I);

IskinRed = Iskin(:, :, 1);
IskinGreen = Iskin(:, :, 2);
IskinBlue = Iskin(:, :, 3);

pixels = [IskinRed(:), IskinGreen(:), IskinBlue(:)]';

end