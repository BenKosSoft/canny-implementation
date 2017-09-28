%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

    Modified OTSU algorithm by mbenlioglu and mertkosan
    THIS FUNCTION SHOULD BE IMPROVED!
%}
function [low_threshold, high_threshold] = otsu_thresholding(img)

[r,c] = size(img);
level = otsuthresh(imhist(img));

s = (r+c) /2;

if(s > 750)
    %%normalize level
    while level > 0.2
        level = level / 2;
    end
else
    %%normalize level
    while level > 0.1
        level = level / 2;
    end
end
    
high_threshold = level;
low_threshold = level / 2;

end