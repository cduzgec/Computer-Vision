function [Imax,Imin] = lab1localmanmix(Im,k);       %% function header
I =double(Im);               %%

[h,w,c] =size(I);        %% check size of the matrix

Imax = zeros(h,w);            %% creating a new empty matrix of size h and w
Imin = zeros(h,w);            %% creating a new empty matrix of size h and w

for i= k+1:h-k                 %%  h and w are rows and cols of matrix
    for j= k+1:w-k               %% k is the parameter we chose to iterate over the matrix
        wp = I(i-k:i+k, j-k:j+k);               %%
        Imax(i,j) = max(wp(:));               %% getting max into a column to create max matrix
        Imin(i,j) = min(wp(:));               %% getting min into a column to create min matrix
    end 
end
Imax =uint8(Imax);               %% converts matrix from double to integer again to show
Imin =uint8(Imin);               %% %% converts matrix from double to integer again to show
 
subplot(1,3,1),imshow(Im);             %%  subplot divides a figure into multiple display regions
title 'Original Image';                %% titling the image
subplot(1,3,2),imshow(Imax);            %%  (a,b,c) a and b defines matrix display regions and c defines the position
title (['Max Filtered Image with k=' num2str(k)] );                %% titling the image
subplot(1,3,3),imshow(Imin);                                       %% 3rd region
title (['Min Filtered Image with k=' num2str(k)] );               %% titling the image


end