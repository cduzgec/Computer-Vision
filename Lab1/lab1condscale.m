function [Jnew] = lab1condscale(Im,Iref)    %% function header

[h,w,c]= size(Im);         %% check size of the matrix
if c==3
    Im= rgb2gray(Im);       %%  converts the truecolor image RGB to the grayscale image
end

[h,w,c]= size(Iref);        %% check size of the matrix
if c==3                     %% c shows the third dimension and it encodes RGB
    Iref = rgb2gray(Iref);       %%  converts the truecolor image RGB to the grayscale image
end

X =double(Im);         %% converts our matrix from integer to double cause we need double to use some properties
Y =double(Iref);       %% converts our matrix from integer to double cause we need double to use some properties

b = std(Y(:))/std(X(:));         %% calculating standart deviation of matrices

a = mean(Y(:))/b-mean(X(:));         %% calculating means of matrices and implementing the formula

Xnew = b*(X+a);         %% implementing the formula

disp( [ mean( Y(:) ) , mean( Xnew(:) ) ] )                   %% displaying the means of Y and Xnew as column
disp( [ std( Y(:) ), std( X(:) ), std( Xnew(:) ) ] )         %% displaying the standart deviations of Y and X a and Xnew as column

Xnew = uint8(Xnew);          %% %% converts matrix from double to integer again to show


subplot(2,2,1),imshow(Iref);     %%  subplot divides a figure into multiple display regions, 1st region
title 'Reference Image';          %% titling the image
 
subplot(2,2,3),imshow(Im);        %%  (a,b,c) a and b defines matrix display regions and c defines the position, 3rd region
title 'Current Image';        %% titling the image

subplot(2,2,4),imshow(Xnew);        %% 4th region
title 'Processed Image';         %% titling the image

end