%% Q1 Corner Detection
clear all; close all; clc;
tic
img= imread ('Monastry.bmp');
imshow(img);
Corners_Filtered = lab4ktcorners(img);
toc

%% Q2 Hough Lines
clear all; close all; clc;
tic
img= imread('checker.jpg');
[H,thet,rho] = lab4houghlines(img);

%% Q3 Hough Circles
clear all;close all;clc;
tic
img = imread('circlesBrightDark.png');
[centersBright, radiiBright,centersDark, radiiDark] = lab4houghcircles(img);
toc

