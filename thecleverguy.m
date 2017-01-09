%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

Canny the Clever Guy implementation
%}
close all; clear all; clc;

img = imread('Mert.jpg');
figure; imshow(img); title('Original Image');
[imgNew] = prepare_image(img);

tic
canny = edge(imgNew, 'Canny', [0.085 0.170]);
figure; imshow(canny); title('MATLAB canny');
toc

gauss_kernel_size = 2;
gauss_kernel = 1/273.*[1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];

kernel_size = 1;
type = 'Sobel';
[kernel_x, kernel_y] = return_derivation_kernel(type);

%{
  conv2 is far better than my convolution function in terms of speed 
  so, i used conv2 and 'Same' parameters results same img size
%}
[imgS] = conv2(imgNew, gauss_kernel, 'SAME'); 
%convolution(imgNew, gauss_kernel, gauss_kernel_size);
figure; imshow(imgS); title('After Gauss Smoothing');

%derivation
[imgX] = conv2(imgS, kernel_x, 'SAME'); 
%convolution(imgS, kernel_x, kernel_size);
[imgY] = conv2(imgS, kernel_y, 'SAME'); 
%convolution(imgS, kernel_y, kernel_size);

%{
    merge two derivative image
    abs method also can be used but, this method is more sufficient to
    detect edges correctly
%}
imgXY = sqrt(imgX.^2+imgY.^2);
%imgXY = abs(imgX) + abs(imgY);
figure; imshow(imgXY); title('After derivation');

tic
%direction between two derivatives
angles = atan2(imgY, imgX) * 180 / pi;
normalized_angles = normalize_directions(angles);
figure; imagesc(normalized_angles); title('Angles in colormap'); colorbar;
toc

tic
%nonmax supression
thinner_imgXY = nonmax_supression(imgXY, normalized_angles);
thinner_imgXY = thinner_imgXY.*imgXY;
figure; imshow(thinner_imgXY); title('After nonmax supression'); 
toc

tic
%hythresis thresholding
%change the threshold value to see different result
%TODO: otsu method should be applied to determine threshold
low_threshold = 0.085;
high_threshold = 0.170;
result_img = h_thresholding(thinner_imgXY, low_threshold, high_threshold);
figure; imshow(result_img); title('Final Image'); 
toc

%DONE CANNY (THE CLEVER GUY) IMPLEMENTATION
%IT CAN BE IMPROVED BY CHANGING NON-MAX SUPRESSION 
%AND HYTHRESIS THRESHOLDING ALGORITHM