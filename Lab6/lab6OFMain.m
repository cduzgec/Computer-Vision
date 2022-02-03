clear all; close all; clc;

% Load the files given in SUcourse as Seq variable
load('sphere.mat');
load('traffic.mat');
load('cars1.mat');
load('cars2.mat');
load('rubic.mat');
load('taxi.mat');

Seq = sphere;

[row,col,num]=size(Seq);

% Define k and Threshold
k=30;  Threshold = 2*10^4;   % window size paramater


for j=2:1:num
ImPrev = Seq(:,:,j-1);  % first image
ImCurr = Seq(:,:,j);    % second image
lab6OF(ImPrev,ImCurr,k,Threshold);
pause(0.1);
end
