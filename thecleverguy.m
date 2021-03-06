%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

Canny Edge Detector implementation
%}
close all; clear all; clc;

img = imread('images\Taryn Harbridge.png');
figure; imshow(img); title('Original Image');
[imgNew] = prepare_image(img);

tic
[canny, thresh] = edge(imgNew, 'Canny');
figure; imshow(canny); title('MATLAB canny');
toc

gauss_kernel_size = 2;
gauss_kernel = 1/273.*[1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];

kernel_size = 7;
type = 'Sobel';
[kernel_x, kernel_y] = return_derivation_kernel(type, kernel_size);

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
thinner_imgXY = nonmax_suppression(imgXY, normalized_angles);
thinner_imgXY = thinner_imgXY.*imgXY;
figure; imshow(thinner_imgXY); title('After nonmax supression'); 
toc

tic
%hythresis thresholding
%OTSU
[low_threshold, high_threshold] = otsu_thresholding(imgXY);
result_img = h_thresholding(thinner_imgXY, low_threshold, high_threshold);
figure; imshow(result_img); title('Final Image'); 
toc

%DONE CANNY EDGE DETECTOR IMPLEMENTATION
%IT CAN BE IMPROVED BY CHANGING NON-MAX SUPRESSION 
%AND HYTHRESIS THRESHOLDING ALGORITHM (OTSU THRESHOLDING)