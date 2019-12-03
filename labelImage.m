function [features, labels] = labelImage(convImage, image, imageN)


[width, height, channels] = size(image);
features = zeros(width, height);
labels = zeros(width, height);
for i = 1:width
    for j = 1:height
        features(i,j,1) = convImage(i,j,1);
        features(i,j,2) = convImage(i,j,2);
        if imageN(i,j,1) == 255 & imageN(i,j,2) == 255 & imageN(i,j,3) == 255
            labels(i,j) = 0;
        else
            labels(i,j) = 1;
        end
    end
end