%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

takes a matrix which contains directions of the pixels in image, then at
the end, it turns angles into rounding angles with ignoring direction which
means for example 180 can be considered as 0. At the end there will be only
0, 45, 90 and 135 degrees for angles.
%}
function [normalized_angles] = normalize_directions(angles)

[r,c] = size(angles);
normalized_angles = zeros(r,c);

for i=1:1:r
    for j=1:1:c
       direction = angles(i,j); 
        
       %normalize negative angles
       if(direction < 0); direction = direction + 360; 
       end
       
       %normalize angle to nearest 45k angle
       if(direction > 337); normalized_angles(i,j) = 360;
       elseif(direction > 292); normalized_angles(i,j) = 315;
       elseif(direction > 247); normalized_angles(i,j) = 270;
       elseif(direction > 202); normalized_angles(i,j) = 225;
       elseif(direction > 157); normalized_angles(i,j) = 180;
       elseif(direction > 112); normalized_angles(i,j) = 135;
       elseif(direction > 77); normalized_angles(i,j) = 90;
       elseif(direction > 22); normalized_angles(i,j) = 45;
       else normalized_angles(i,j) = 0;
       end
       
       %normalize angles to 0,45,90,135, because k = k + 180 if you ignore
       %the direction of the angles. 
       direction = normalized_angles(i,j);
       if(direction == 360 || direction == 180); normalized_angles(i,j) = 0;
       elseif(direction == 315); normalized_angles(i,j) = 135;
       elseif(direction == 270); normalized_angles(i,j) = 90;
       elseif(direction == 225); normalized_angles(i,j) = 45;
       end
       
    end
end
end