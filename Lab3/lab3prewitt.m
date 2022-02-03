function [I_edge] = lab3prewitt(I,T)
    [r,c,ch] = size(I);
    if ch == 3
        I = rgb2gray(I);
    end
    
    I = double(I);
    Sx = -[-1 0 1;-1 0 1 ; -1 0 1 ];   % multiply by -1 direction will change
    Sy = [-1 -1 -1; 0 0 0; 1 1 1];    % kernels sign determines the detection direction
    
    k = 1;
    Gx = zeros(size(I))
    Gy = zeros(size(I))
    
    %Convolution
    
    for i = k+1:1:r-k-1
       for j = k+1:1:c-k-1
           window = I(i-k:i+k,j-k:j+k);
           Xvalue= sum(sum(window.*Sx));  
           Yvalue= sum(sum(window.*Sy));
           Gx(i,j) = Xvalue;
           Gy(i,j) = Yvalue;
        end
    end
    
    G_mag = sqrt(Gx.^2 + Gy.^2);
    I_edge = zeros(size(G_mag));
    I_edge(find(G_mag > T)) = 255;
    
    
     figure 
     subplot(2,3,1), imshow(uint8(I))
     title ('Original İmage')
     subplot(2,3,2), imshow(uint8(Gx))
     title ('Sobel X Filter')
     subplot(2,3,3), imshow(uint8(Gy))
     title ('Sobel Y Filter')
     subplot(2,3,5), imshow(uint8(G_mag))
     title ('Sobel Gradient')
     subplot(2,3,6), imshow(uint8(I_edge))
     title ('Sobel Edges')

end
    
    
    
    
    
    
    
    
    
    
    
    
    
           