%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

takes input as ImgXY, which is combined image of derivatives of image,
and make edges thinner by nonmax_supression algorithm which main part of
Canny Implementation

takes input as normalized_angles which is result of normalize_directions.m
function
%}
function [thinner_ImgXY] = nonmax_suppression(ImgXY, normalized_angles)

[r,c] = size(ImgXY);
thinner_ImgXY = zeros(r,c);

for i=1+1:1:r-1
   for j=1+1:1:c-1
       current_value = ImgXY(i,j);
       switch normalized_angles(i,j)
           case 0
               max_value = max([current_value, ImgXY(i,j-1), ImgXY(i, j+1)]);
               if(current_value == max_value)
                   thinner_ImgXY(i,j) = 1;
               else
                   thinner_ImgXY(i,j) = 0;
               end
           case 45
               max_value = max([current_value, ImgXY(i+1,j-1), ImgXY(i-1, j+1)]);
               if(current_value == max_value)
                   thinner_ImgXY(i,j) = 1;
               else
                   thinner_ImgXY(i,j) = 0;
               end
           case 90
               max_value = max([current_value, ImgXY(i-1,j), ImgXY(i+1, j)]);
               if(current_value == max_value)
                   thinner_ImgXY(i,j) = 1;
               else
                   thinner_ImgXY(i,j) = 0;
               end
           case 135
               max_value = max([current_value, ImgXY(i-1,j-1), ImgXY(i+1, j+1)]);
               if(current_value == max_value)
                   thinner_ImgXY(i,j) = 1;
               else
                   thinner_ImgXY(i,j) = 0;
               end
           otherwise
               thinner_ImgXY(i,j) = 0;
       end
   end
end

end