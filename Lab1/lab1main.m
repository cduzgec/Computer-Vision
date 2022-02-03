%% Linear Scaling
clc; clear; close all %%  clear variables in workspace, memory, command window

Im =imread('city.png');   %% reading image from path

[Inew] = lab1linscale(Im);  %% go to function

%% Conditional Scaling

clc; clear; close all  %%  clear variables in workspace, memory, command window

Im =imread('city.png');  %% reading image from path

Iref =imread('board.jpg');  %% reading image from path

[Jnew] = lab1condscale(Im,Iref); %% go to function

%% Box Filter

clc; clear; close all %%  clear variables in workspace, memory, command window

Im =imread('jump.png'); %% reading image from path
k=5;                    %% k is a variable to that we send to the function

[Inew] = lab1locbox(Im,k); %% go to function

%% Local Min Local Max

clc; clear; close all  %%  clear variables in workspace, memory, command window

Im =imread('currentImage.png');  %% reading image from path
k=3;                              %% k is a variable to that we send to the function

[Imax,Imin] = lab1localmanmix(Im,k); %% go to function

