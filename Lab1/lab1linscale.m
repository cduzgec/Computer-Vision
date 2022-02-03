function [Inew] = lab1linscale(Im) %% function header

[h,w,c]= size(Im); %% check size of the matrix
if c==3
    Im= rgb2gray(Im); %% converts the truecolor image RGB to the grayscale image
end

Itemp =double(Im);      %% converts matrix from integer to double cause we need double to use some properties
a =-min(Itemp(:));      %% since it is a matrix not an array we need to put (:) to put the matrix into a column to calculate min value of matrix
Gmax =255;              %% RGB color scale has 255 as the biggest value 
b = Gmax / (max(Itemp(:))- min(Itemp(:)));     %%  using max and min of matrix to adjust color scaling

Inew = b*(Itemp+a);     %% we have this formula for linear scaling

Inew=uint8(Inew);       %% converts matrix from double to integer again to show
                                   
subplot(2,2,1),imshow(Im);         %%  subplot divides a figure into multiple display regions
title 'Original Image'             %% titling the image
subplot(2,2,2),imshow(Inew);       %%  (a,b,c) a and b defines matrix display regions and c defines the position
title 'Scaled Image'                %% display regions are 4  becase of 2x2 and this one is on the 3rd region
subplot(2,2,3),histogram(Im);       %% displaying the histogram of image
subplot(2,2,4),histogram(Inew);     %% this one is on the 4th region


end