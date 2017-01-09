%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

return kernel based on type
%}
function [kernel_x, kernel_y] = return_derivation_kernel(type)

%Sobel
sobel_kernel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_kernel_y = [1 2 1; 0 0 0; -1 -2 -1];

%Prewitt
prewitt_kernel_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_kernel_y = [1 1 1; 0 0 0; -1 -1 -1];

%Roberts
%roberts_kernel_x = [-1 0 1; -1 0 1; -1 0 1];
%roberts_kernel_y = [1 1 1; 0 0 0; -1 -1 -1];

if(strcmp(type,'Sobel'))
    kernel_x = sobel_kernel_x;
    kernel_y = sobel_kernel_y;
elseif(strcmp(type,'Prewitt'))
    kernel_x = prewitt_kernel_x;
    kernel_y = prewitt_kernel_y;
%{
elseif(strcmp(type,'Roberts'))
    kernel_x = roberts_kernel_x;
    kernel_y = roberts_kernel_y;
%}
else
    error('Wrong Kernel Type in : return_derivation_kernel!');
end

end

