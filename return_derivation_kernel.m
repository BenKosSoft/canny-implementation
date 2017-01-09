%{
owner: mertkosan (Mert Kosan), mbenlioglu(Muhammed Mucahid Benlioglu)
created date: 09.01.2017

return kernel based on type
%}
function [kernel_x, kernel_y] = return_derivation_kernel(type, kernel_size)

narginchk(1,2);

%Sobel
sobel_kernel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_kernel_y = [1 2 1; 0 0 0; -1 -2 -1];

%Prewitt
prewitt_kernel_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_kernel_y = [1 1 1; 0 0 0; -1 -1 -1];

if(strcmp(type,'Sobel'))
    if nargin ~= 1
        if ~mod(kernel_size,2); kernel_size=kernel_size+1;end;
        for i=3:2:kernel_size-2
            sobel_kernel_x = conv2([1 2 1]' * [1 2 1], sobel_kernel_x);
            sobel_kernel_y = conv2([1 2 1]' * [1 2 1], sobel_kernel_y);
        end
    end
    kernel_x = sobel_kernel_x;
    kernel_y = sobel_kernel_y;
elseif(strcmp(type,'Prewitt'))
    if nargin ~= 1
        error('kernel_size paramater only valid for Sobel');
    end
    kernel_x = prewitt_kernel_x;
    kernel_y = prewitt_kernel_y;
else
    error('Wrong Kernel Type in : return_derivation_kernel!');
end

end

