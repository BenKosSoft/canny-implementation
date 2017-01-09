%{
    this function is created by mertkosan and mbenlioglu at 10.01.2017

    algorithm is taken from https://en.wikipedia.org/wiki/Otsu%27s_method
    some modification is added to that.
%}
function [low_threshold, high_threshold] = otsu_thresholding(img)

histogram = imhist(img);
total = sum(histogram);

sumB = 0;
wB = 0;
maximum = 0.0;
sum1 = dot((0:255), histogram); 
for i=1:256
    wB = wB + histogram(i);
    if (wB == 0)
        continue;
    end
    wF = total - wB;
    if (wF == 0)
        break;
    end
    sumB = sumB +  (i-1) * histogram(i);
    mB = sumB / wB;
    mF = (sum1 - sumB) / wF;
    between = wB * wF * (mB - mF) * (mB - mF);
    if ( between >= maximum )
        level = i;
        maximum = between;
    end
end

%level is 0 to 256, it should be normalized...

level = level / 256;

%%normalize level
while level > 0.2
    level = level / 2;
end

high_threshold = level;
low_threshold = level / 2;

end