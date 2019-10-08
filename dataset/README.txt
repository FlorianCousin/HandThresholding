In this readme, I will describe what is in each folder.

gaussian_gaussian > result of the thresholding with both skin and background estimated as gaussian

gaussian_gaussian_aprioSkin1e-10 > result of the thresholding with both skin and background estimated as gaussian but the skin apriori probability is 1e-10 and the one of the background is 1-1e-10

gaussian_kernel(100,0.02) > result of the thresholding with the skin estimated as gaussian and the background estimated with mvksdensity function with a bandwidth of 0.02 and with 100 pixels

gaussian_kernel(100,0.05) > result of the thresholding with the skin estimated as gaussian and the background estimated with mvksdensity function with a bandwidth of 0.05 and with 100 pixels

kernel(100,0.05)_kernel(100,0.05) > result of the thresholding with both the skin and the background estimated with mvksdensity function with a bandwidth of 0.05 and with 100 pixels

test > part of the original dataset on which I tested the code

thresholding > folder in which images are saved when the threshold function is called

training > part of the original dataset that is not in test. I used some of these images to make the dataset of skin pixels and background pixels but a lot of images have not been used.

If not mentioned, the results are with both skin and backrground apriori probability equal to 0.5