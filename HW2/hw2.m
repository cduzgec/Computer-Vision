% Prewitt Roberts Canny Laplacian of Gaussian (LoG)

demoImageFolder = fileparts(which('coins.png'))
clear all; close all; clc;

% tape 
%% Prewitt
clear all; close all; clc;
I = imread('coins.png');
[r,c,ch] = size(I);
if ch == 3
    I = rgb2gray(I);
end
tic
PH1 = edge(I,'prewitt',0.02, 'horizontal');
toc
PH2 = edge(I,'prewitt',0.04, 'horizontal');
PH3 = edge(I,'prewitt',0.08, 'horizontal');

PV1 = edge(I,'prewitt',0.03,'vertical'); 
PV2 = edge(I,'prewitt',0.05,'vertical'); 
PV3 = edge(I,'prewitt',0.07,'vertical'); 

PB1 = edge(I,'prewitt',0.03,'both'); 
PB2 = edge(I,'prewitt',0.06,'both'); 
PB3 = edge(I,'prewitt',0.08,'both'); 

figure
subplot(4,3,1), imshow(I)
title ('Original İmage')

subplot(4,3,4), imshow(PH1)
title ('Horizontal Prewitt t= 0.02 ')
subplot(4,3,5), imshow(PH2)
title ('Horizontal Prewitt t= 0.04 ')
subplot(4,3,6), imshow(PH3)
title ('Horizontal Prewitt t= 0.08 ')

subplot(4,3,7), imshow(PV1)
title ('Vertical Prewitt t= 0.03 ')
subplot(4,3,8), imshow(PV2)
title ('Vertical Prewitt t= 0.05 ')
subplot(4,3,9), imshow(PV3)
title ('Vertical Prewitt t= 0.07 ')


subplot(4,3,10), imshow(PB1)
title ('Both directions Prewitt t= 0.03 ')
subplot(4,3,11), imshow(PB2)
title ('Both directions Prewitt t= 0.06 ')
subplot(4,3,12), imshow(PB3)
title ('Both directions Prewitt t= 0.08 ')


%% Roberts
clear all; close all; clc;
I = imread('coins.png');

    [r,c,ch] = size(I);
    if ch == 3
        I = rgb2gray(I);
    end
tic
PH1 = edge(I,'roberts',0.01, 'horizontal');
toc
PH2 = edge(I,'roberts',0.04, 'horizontal');
PH3 = edge(I,'roberts',0.07, 'horizontal');

PV1 = edge(I,'roberts',0.02,'vertical'); 
PV2 = edge(I,'roberts',0.05,'vertical'); 
PV3 = edge(I,'roberts',0.08,'vertical'); 

PB1 = edge(I,'roberts',0.03,'both'); 
PB2 = edge(I,'roberts',0.05,'both'); 
PB3 = edge(I,'roberts',0.08,'both'); 

figure
subplot(4,3,1), imshow(I)
title ('Original İmage')

subplot(4,3,4), imshow(PH1)
title ('Horizontal Roberts t= 0.01 ')
subplot(4,3,5), imshow(PH2)
title ('Horizontal Roberts t= 0.04 ')
subplot(4,3,6), imshow(PH3)
title ('Horizontal Roberts t= 0.07 ')

subplot(4,3,7), imshow(PV1)
title ('Vertical Roberts t= 0.02 ')
subplot(4,3,8), imshow(PV2)
title ('Vertical Roberts t= 0.05 ')
subplot(4,3,9), imshow(PV3)
title ('Vertical Roberts t= 0.08 ')


subplot(4,3,10), imshow(PB1)
title ('Both directions Roberts t= 0.03 ')
subplot(4,3,11), imshow(PB2)
title ('Both directions Roberts t= 0.05 ')
subplot(4,3,12), imshow(PB3)
title ('Both directions Roberts t= 0.08 ')


%% Canny
clear all; close all; clc;
I = imread('coins.png');

    [r,c,ch] = size(I);
    if ch == 3
        I = rgb2gray(I);
    end
tic
C1 = edge(I,'canny',[0.001 0.02]);
toc
C2 = edge(I,'canny',[0.01 0.05]);
C3 = edge(I,'canny',[0.05 0.08]);
C4 = edge(I,'canny',[0.1 0.2]);
C5 = edge(I,'canny',[0.2 0.5]);
C6 = edge(I,'canny',[0.5 0.8]);

figure
subplot(3,3,1), imshow(I)
title ('Original İmage')

subplot(3,3,4), imshow(C1)
title ('Canny t= [0.001 0.02]')
subplot(3,3,5), imshow(C2)
title ('Canny t= [0.01 0.05]')
subplot(3,3,6), imshow(C3)
title ('Canny t= [0.1 0.2]')

subplot(3,3,7), imshow(C4)
title ('Canny t= [0.1 0.2]')
subplot(3,3,8), imshow(C5)
title ('Canny t= [0.2 0.5]')
subplot(3,3,9), imshow(C6)
title ('Canny t= [0.5 0.8]')

%% Laplacian of Gaussian (LoG)
clear all; close all; clc;
I = imread('coins.png');

    [r,c,ch] = size(I);
    if ch == 3
        I = rgb2gray(I);
    end
    
tic    
L1 = edge(I,'log',0.001); 
toc
L2 = edge(I,'log',0.01); 
L3 = edge(I,'log',0.02); 


figure
subplot(3,3,1), imshow(I)
title ('Original İmage')

subplot(3,3,4), imshow(L1)
title ('LoG t=0.001 ')
subplot(3,3,5), imshow(L2)
title ('LoG t=0.01')
subplot(3,3,6), imshow(L3)
title ('LoG t=0.02')