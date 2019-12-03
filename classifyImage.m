function[labeledImage,probImage1] = classifyImage( image, priors, hist1,hist2, hist)
tic
[width,height,channel] = size(image);
probImage1 = zeros(width,height, 'double');
probImage2 = zeros(width,height, 'double');
evidence = zeros(width,height,'double');
probImage1 = probImage1 * priors(1);
for i = 1:width
    s1 = sum(sum(hist1));
    s = sum(sum(hist));
    for j = 1:height
        probImage1(i,j) = priors(1);
        probImage1(i,j) = (probImage1(i,j)*calculateProb(hist1,image(i,j,:),s1)) / calculateProb(hist,image(i,j,:),s);
    end
end
labeledImage = zeros(width,height);
for i = 1:width
    for j = 1:height
        if probImage1(i,j) >0.5
            labeledImage(i,j) = 1;%white
        else
            labeledImage(i,j) = 0;%black
        end
    end
end

imshow(labeledImage);
labeledImage = eliminateNoise(labeledImage);
imshow(labeledImage);
SE = strel('square', 10);
labeledImage = imdilate(labeledImage,SE);
labeledImage = imerode(labeledImage, SE);
imshow(labeledImage);


% while done == 1
%      done = 0
%     for i = 2: width-1
%         for j = 2:height-1
%             if labeledImage(i,j) == 0 && probImage1(i,j) > 0.35
%                 se = [ labeledImage(i-1,j), labeledImage(i+1,j), labeledImage(i+1,j-1), labeledImage(i+1,j), labeledImage(i+1,j+1),labeledImage(i-1, j+1),labeledImage(i-1,j), labeledImage(i-1, j-1)];
%                 labeledImage(i,j) = max(se);
% %                   done = 1;
%             end
%         end 
%     end
%   end
% pause
toc