function [features, labels] = generateFeatureMatrix(featureImage, labelImage)

[width1,height1,channels1] = size(featureImage);
features = zeros(width1*height1,2,'double');
labels = zeros(width1*height1,1);
size(features);
channel1 = featureImage(:,:,1);
channel2 = featureImage(:,:,2);
% channel3 = featureImage(:,:,3);
k = 0;
for i = 1:height1
    for j = 1:width1
        k= k +1;
%         features((i-1)*(width1)+j, 1) = channel1(j,i);
        features((i-1)*(width1)+j, 1) = channel1(j,i);
        features((i-1)*(width1)+j, 2) = channel2(j,i);
        labels((i-1)*(width1)+j,1) = labelImage(j,i);
    end
end
