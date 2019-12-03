function [newImage] = convertImage(oldImage)

[width,height,channels] = size(oldImage);
channel1 = double(oldImage(:,:,1));
channel2 = double(oldImage(:,:,2));
channel3 = double(oldImage(:,:,3));
y = zeros(width,height,1);
newImage = zeros(width,height,2);

for i = 1:width
    for j = 1:height
        y(i,j) = channel1(i,j)*0.299 + channel2(i,j)*0.587 + channel3(i,j)*0.114;
%         newImage(i,j,1) = channel1(i,j)*0.299 + channel2(i,j)*0.587 + channel3(i,j)*0.114;
        newImage(i,j,1) = channel1(i,j)*(-0.14713) - channel2(i,j)*0.28886 + channel3(i,j)*0.436;
        newImage(i,j,2) = channel1(i,j)*0.615 - channel2(i,j)*0.51499 - channel3(i,j)*0.10001;
    end
end
% imshow(y);