%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

    Modified OTSU algorithm by mbenlioglu and mertkosan
%}
function [low_threshold, high_threshold] = otsu_thresholding(img)

level = otsuthresh(imhist(img));

%%normalize level
while level > 0.2
    level = level / 2;
end

high_threshold = level;
low_threshold = level / 2;

end