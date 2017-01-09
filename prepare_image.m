%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

takes an image input and turns into gray scale if it is rgb, and turns
image pixel number uint8 to double
%}
function [last_img] = prepare_image(img)

if(size(img,3) == 3)
    img = rgb2gray(img);
end

img = im2double(img);
last_img = img;

end