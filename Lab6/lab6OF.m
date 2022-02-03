function lab6OF(ImPrev,ImCurr,k,Threshold)
    % Smooth the input images using a Box filter -builtin box or conv2
    %Filtered_Curr = imgaussfilt(double(ImCurr),3); % k is different from main k
    %Filtered_Prev = imgaussfilt(double(ImPrev),3); % k should be 2 or 3
    
    Filtered_Curr = imboxfilt(double(ImCurr),3); 
    Filtered_Prev = imboxfilt(double(ImPrev),3); 
    
    % Calculate spatial gradients (Ix, Iy) using Prewitt filter - use
    % conv2(Im, filter) not builtin prewitt
    xFilter = [-1 0 1; -1 0 1; -1 0 1];
    yFilter = [-1 -1 -1; 0 0 0; 1 1 1];
        
    Ix = conv2(Filtered_Curr, xFilter, 'same');
    Iy = conv2(Filtered_Curr, yFilter, 'same');
    
    %Spatial --> current frame
    %Temporal --> using both current and prev
    %temporal = that evolving with time not with place - one line code
    
    % Calculate temporal (It) gradient - use prev image here only
    It = -(Filtered_Curr - Filtered_Prev);
    
    [yDim,xDim] = size(Filtered_Curr); 
    Vx = zeros(yDim,xDim); 
    Vy = zeros(yDim,xDim); 
    G = zeros(2,2); 
    b = zeros(2,1);

    for x=k+1:k:xDim-k-1 
        for y=k+1:k:yDim-k-1           
            subIx = Ix(y-k:y+k,x-k:x+k);
            subIy = Iy(y-k:y+k,x-k:x+k);
            subIt = It(y-k:y+k,x-k:x+k);
            
            % Calculate the elements of G and b 
            G = [sum(sum(subIx.^2)) sum(sum(subIx.*subIy)); sum(sum(subIx.*subIy)) sum(sum(subIy.^2))];
            b = [sum(sum(subIx.*subIt)); sum(sum(subIy.*subIt))];

            if (min(eig(G)) > Threshold) 
                % Calculate u
                u = -(inv(G)).*b;
                Vx(y,x)=u(1); 
                Vy(y,x)=u(2); 
            end
        end
    end
    
    cla reset;
    imagesc(ImPrev); hold on;
    [xramp,yramp] = meshgrid(1:1:xDim,1:1:yDim);
    quiver(xramp,yramp,Vx,Vy,10,'r');
    colormap gray;  %drawnow; %add drawnow when you comment out pause
end









