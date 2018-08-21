function newImg = reduce_intensity_level(img, level)
% Function to change the intensity level
% level  = Desired number of intensity levels(power of 2); maximum number of level is 256 
w = 255/level;
newImg = w * round(img/w);
end
