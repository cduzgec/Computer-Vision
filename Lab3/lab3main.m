%% Edge Detection
clear all; close all; clc;

%% Sobel
I = imread('peppers.png');
Thres = 50;
Im_sobel = lab3sobel(I,Thres);

%% Prewitt
Tresh2 = 100;
Im_perwitt = lab3prewitt(I,Tresh2);

%% Laplacian

I2 = imread('Object_contours.jpg');
T1 = 5;
T2 = 10;
G = lab3log(I2,T1,T2);

