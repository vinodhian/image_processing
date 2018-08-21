% function for convolution/mean_filter
% img - input image
% convSize - mean filter size eg., 3, 5, 6, etc
% the mean_filter implementation handles both odd and even sized kernel
function convImg = mean_filter(img, convSize)
convImg = img;
[row,col] = size(img);
if mod(convSize,2) == 0
    up = convSize/2;
    down = convSize/2 - 1;
    left = up;
    right = down;
else
    up = floor(convSize/2);
    down = up;
    left = up;
    right = up;
end
for i =1:row
    for j = 1:col
        cLeft = (j-left)*((j-left) >= 1) + 1*((j-left)<1);
        cRight = (j+right)*((j+right) <= col) + col*((j+right)>col);
        cUp = (i-up)*((i-up) >= 1) + 1*((i-up)<1);
        cDown = (i+down)*((i+down) <= row) + row*((i+down)>row);
        
        convImg(i,j) = 0;
        tempKernel = img(cUp:cDown,cLeft:cRight);
        [tx,ty] = size(tempKernel);
        convImg(i,j) = sum(tempKernel(:))/(tx*ty);
    end
end
end
