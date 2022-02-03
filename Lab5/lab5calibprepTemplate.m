clear all; close all; clc;

img = imread('calibrationObject.png');
[row, col, ch]=size(img);
if ch==3
    img_gray = rgb2gray(img);
end
%% img_edge DETECTION
img_edge = edge(img_gray,'canny'); % for post-lab use different detectors
%imshow(img_edge);

%% LINE DETECTION
%% HOUGH TRANSFORM - Extract Lines
[H,theta,rho] = hough(img_edge,'RhoResolution',0.8,'Theta',-90:0.5:89);
P  = houghpeaks(H,60,'Threshold',0.5*max(H(:)));
line = houghlines(img_edge,theta,rho,P,'FillGap',15,'MinLength',30);

%% PLOT HOUGHLINES  

figure 
subplot(1,2,1), imshow(img)   %original 
subplot(1,2,2), imshow(img_gray) %grey image
hold on
for k = 1:length(line)
    xy = [line(k).point1; line(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green'); % line
    plot(xy(1,1),xy(1,2),'x','MarkerSize',4,'Color','yellow');  % beginning point
    plot(xy(2,1),xy(2,2),'x','MarkerSize',4,'Color','red');   % end point
    %len = norm(line(k).point1 - line(k).point2);  %you dont need it
end

%% SELECT TWO INTERSECTING LINES MANUALLY

 Line1_B = [42 161];
 Line1_E =[190 227];
 Line2_B = [141 133];
 Line2_E = [169 334];

% Extract corresponding theta (T) and rho (R) values from the output of 'houghlines' function

[row,col] = size(line);

Rhos = [0;0];
Thetas = [0;0];

for k = 1:length(line)
    
    if(ismember(Line1_B, line(k).point1, 'rows')&&ismember(Line1_E, line(k).point2, 'rows'))
        Rhos(1,1) = line(k).rho ;
        Thetas(1,1) = line(k).theta ;
    end

     if(ismember(Line2_B,line(k).point1, 'rows')&&ismember(Line2_E,line(k).point2, 'rows'))
        Rhos(2,1) = line(k).rho ;
        Thetas(2,1) = line(k).theta ;
    end
end
%% PLOT INTERSECTING LINES
x_v = 0:size(img,1);
y_v = (Rhos(1,1) - x_v* cosd(Thetas(1,1)) )/ sind(Thetas(1,1));
x_h = 0:size(img,2);
y_h = (Rhos(2,1) - x_h* cosd(Thetas(2,1)) )/ sind(Thetas(2,1));

figure;
imshow(img_gray);
hold on
plot(x_v,y_v,'Color','magenta');
plot(x_h,y_h,'Color','magenta');
%%  Solving the 2 line equations to find intersection point (corner)
b=Rhos;
% A = [cosd(L1_theta) sind(L1_theta) ; cosd(L2_theta) sind(L2_theta)];
A = [cosd(Thetas(1,1)) sind(Thetas(1,1)); cosd(Thetas(2,1)) sind(Thetas(2,1))];
C = A\b; %Corner=inv(A)*Rhos

%% CORNER DETECTION
HarrisCorners = corner(img_gray,'Harris');

% figure(12);
% imshow(img_gray);
% hold on
% plot(HarrisCorners(:,1),HarrisCorners(:,2),'*r');
%% PLOTTING CORNERS FOR COMPARISON
plot(C(1,1),C(2,1),'om'); %hough, intersection
plot(HarrisCorners(:,1),HarrisCorners(:,2),'ob'); %harris

%% Calculate and display the distance between two corner points that
