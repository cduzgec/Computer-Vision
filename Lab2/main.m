%% Linear Filtering 

clear all;close all;clc;
img = imread('jump.png');
ResImg = lab2gaussfilt(img);
  
 %% Non_Linear Filtering Median
 
clear all;close all;clc;
img = imread('Tiger.png');
k = 2;
ResImg= lab2medfilt(img,k);


%% Sharpening

clear all;close all;clc;
img = imread('mother.png');
limbda = 10;
Mode = 1;
ResImg = lab2sharpen(img,limbda,Mode);


%% First Derivative
clear all;close all;clc;
img = imread('house.png');
[x_filtered, y_filtered] = lab2sobelfilt(img);
