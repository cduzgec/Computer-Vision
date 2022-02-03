function [Filtered_img] = lab2gaussfilt(img)

    [row,col,ch]= size(img);
    if (ch ==3)
        img = rgb2gray(img);
    end
    
    Gaussian_matrix = (1/273.)*[1   4   7   4    1  ;
                                4   16  26  16   4  ;
                                7   26  41  26   7  ;
                                4   16  26  16   4  ; 
                                1   4   7   4    1  ];

    Filtered_img = zeros(size(img));
    img = double(img);
    k= 2;
     
    for i=k+1:1:row-k
        for j = k+1:1:col-k
            Window = img(i-k:i+k,j-k:j+k);
            value = sum(sum(Window.*Gaussian_matrix));
            Filtered_img(i,j) = value;
        end
    end
        
    img = uint8(img);
    Filtered_img = uint8(Filtered_img);
    
    figure
    subplot(1,2,1)
        imshow(img)
        title('original');
    subplot(1,2,2)
        imshow(Filtered_img)
        title('linear filtered');

end