function [I_edge] = lab3sobel(I,T)
    [r,c,ch] = size(I);
    if ch == 3
        Im = rgb2gray(I);
    end
    
 Im = double(Im);
 % Calculate gradient magnitude and threshold
 [Gx,Gy] = lab2sobelfilt(Im); 
 % Find magnitude  of gradient
 % Threshold Hint (find)
 Gx = double(Gx);
 Gy = double(Gy);

 G_mag = sqrt(Gx.^2 + Gy.^2);
 
 I_edge= zeros(size(G_mag)); 
 I_edge(find(G_mag > T)) = 255; % find number of every pixel which is greater than threshold to make them white
 
 figure 
 subplot(2,3,1), imshow(uint8(Im))
 title ('Original İmage')
 subplot(2,3,2), imshow(uint8(Gx))
 title ('Sobel X Filter')
 subplot(2,3,3), imshow(uint8(Gy))
 title ('Sobel Y Filter')
 subplot(2,3,5), imshow(uint8(G_mag))
 title ('Sobel Gradient')
 subplot(2,3,6), imshow(uint8(I_edge))
 title ('Sobel Edges')
 
 % if you flip the sign of the kernel - to + you can change the direction 
 
 
 
end

 
 