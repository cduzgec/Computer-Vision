function [Inew] = lab1locbox(Im,k);         %% function header
I =double(Im);         %% converts our matrix from integer to double cause we need double to use some properties

[h,w,c] =size(I);      %%  size of the matrix


Inew = I;   %% will use I to update Inew in the loop thats why we need a new matrix with the same size of I

for i= k+1:h-k                            %%  h and w are rows and cols of matrix
    for j= k+1:w-k                       %% k is the parameter we chose to iterate over the matrix
        wp = I(i-k:i+k, j-k:j+k);         %% 
        mean(wp(:));                      %% getting mean of wp into a column
        Inew(i,j) =mean(wp(:));          %% using meaan to create new I
    end 
end

Inew=uint8(Inew);                         %% %% converts matrix from double to integer again to show

subplot(1,2,1),imshow(Im);              %%  subplot divides a figure into multiple display regions, 1st region
title 'Original Image';                %% titling the image
subplot(1,2,2),imshow(Inew);            %%  (a,b,c) a and b defines matrix display regions and c defines the position, 2nd region
title 'Processed Image';                %% titling the image
end