function [Corners_Filtered] = lab4ktcorners(img)

    [row, col, ch] = size(img);
    if (ch == 3)
        img = rgb2gray(img);
    end
    
    Corners_Filtered = zeros( size(img));
    
    % Transform double 
    img= double(img);
    Corners_Filtered = double(Corners_Filtered);
    
    % initialize o corners threshold window size
    corners = [];
    T = 400000;
    k= 1;
    
    %smoothing
    Simg= imgaussfilt(img);

    %Find Gradients
    [Gx,Gy] = imgradientxy(Simg);
    
    
    for i=k+1:1:row-k
        for j = k+1:1:col-k
            WindowX = Gx(i-k:i+k,j-k:j+k);
            WindowY = Gy(i-k:i+k,j-k:j+k);
            
            xx = sum(sum(WindowX.*WindowX));
            yy = sum(sum(WindowY.*WindowY));
            xy = sum(sum(WindowX.*WindowY));
        end
    end
            
    H = [xx xy ; xy yy];
    [e1, e2] = eig(H);
    if (min(e1, e2)>T)
        corners = [corners;i, j];
    end


    
    
    %visualization
    img = uint8(img);
    
    figure;
        imshow(img)
        hold on;
        plot(corners(:,2), corners(:,1), 'r*', 'MarkerSize',7,'LineWidth',1);
        title('Kanade-Tomasi corners detection');
    
end