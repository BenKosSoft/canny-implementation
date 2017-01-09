%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

takes an image input and kernel with kernel size and make a convolution
operation image

normalized_kernel: all elements are divided by total of all elements, in
derivation case this total value is 1.

kernelsize: k value for 2k+1 x 2k+1 window
%}
function [out_img] = convolution(img, normalized_kernel, kernelsize)

[r,c] = size(img);
out_img = zeros(r,c);

for i=kernelsize+1:1:r-kernelsize
    for j=kernelsize+1:1:c-kernelsize
        subimage = img(i-kernelsize:i+kernelsize, j-kernelsize:j+kernelsize);
        out_img(i,j) = sum(sum(subimage.*normalized_kernel));
    end
end

end