%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

takes an input as thinner_imgXY which is result of nonmax_supression.m
function, and we choose two threshold value eliminate low edges but not all
of them.
%}
function [result_img] = h_thresholding(thinner_imgXY, low_threshold, high_threshold)

[r,c] = size(thinner_imgXY);
result_img = zeros(r,c);

maxvalue_in_img = max(max(thinner_imgXY));
low_threshold = low_threshold * maxvalue_in_img;
high_threshold = high_threshold * maxvalue_in_img;

for i=1:1:r
   for j=1:1:c
      value = thinner_imgXY(i,j); 
      if(value >= high_threshold)
            result_img(i,j) = 1;
      elseif(value < high_threshold && value >= low_threshold)
          %look neighbours
          northwest = thinner_imgXY(i-1,j-1);
          west = thinner_imgXY(i,j-1); 
          southwest = thinner_imgXY(i+1,j-1); 
          south = thinner_imgXY(i-1,j); 
          southeast = thinner_imgXY(i+1,j+1); 
          east = thinner_imgXY(i,j+1); 
          northeast = thinner_imgXY(i-1,j+1); 
          north = thinner_imgXY(i-1,j);
          maxValue = max([northwest, west, southwest, south, southeast, east, northeast, north]);
          if(maxValue >= high_threshold)
              result_img(i,j) = 1;
          end
      end
   end
end

%turn binary into 8bit image
result_img = uint8(result_img.*255);

end

