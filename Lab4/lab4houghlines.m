function [H,T,R] = lab4houghlines(I)

    [row,col,ch] = size(I);   
    img = I;
    if (ch==3)
        img = rgb2gray(img);
    end
    
    % Edge Detection: the selection of the edge detector is very significant!
    % Hint use edge built-in function
    img_edges = edge(img,'Canny');
    
    % Hough Transform + Display
  %  [H,T,R] = ...
    [H,T,R] = hough(img_edges,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
    figure('Name','Hough Transform','NumberTitle','off');
        subplot(2,2,1)
        imshow(I);
        title('Original Image');
        
        subplot(2,2,2)
        imshow(img_edges);
        title('Edges using canny Edge detector');
        
        subplot(2,2,3)

        imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
        title('Hough Transform');
        xlabel('\theta'), ylabel('\rho');
        axis on, axis normal, hold on;
    
    % Hough Peaks Points using Threshold + Display
    Thresh = ceil(0.5*max(H(:)));
    
    P = houghpeaks(H,20,'threshold',Thresh);
    x = T(P(:,2)); y = R(P(:,1));
    plot(x,y,'s','color','white');
    
    % Hough Lines + Display
    lines = houghlines(img_edges,T,R,P,'FillGap',20,'MinLength',70);
    
        
    % Plotting All Lines and Highlighting Longest and Shortest Lines
    
    subplot(2,2,4);
    imshow(img),title('Hough Lines Based on canny Edge detector, Threshold = '), hold on

    max_len = 40; 
    min_len = 2000; 
   
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');

       % Plot beginnings and ends of lines
       plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow','Markersize',3);
       plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red','Markersize',3);

       % Determine the endpoints of the longest line segment
       len = norm(lines(k).point1 - lines(k).point2);
       if ( len > max_len)
          max_len = len;
          xy_long = xy;
       end
       
       if (len < min_len)
           min_len = len;
           xy_short = xy;
       end
       
    end
        plot(xy_long(:,1),xy_long(:,2),'LineWidth',1,'Color','cyan');
        plot(xy_short(:,1),xy_short(:,2),'LineWidth',1,'Color','red');

end