function [features1,features2] = separateFeatures(features, labels)

sum1 = 0;
sum2 = 0;

len = size(features, 1);

for i = 1:len
    if labels(i) == 0
        sum1 = sum1 + 1;
    else
        sum2 = sum2 + 1;
    end
end

features1 = zeros(sum1, 2);
features2 = zeros(sum2, 2);

count1= 1;
count2 = 1;

for i = 1:len
    if labels(i) == 0
        features1(count1,1) = features(i,1);
        features1(count1,2) = features(i,2);
        count1 = count1 + 1;
    else
         features2(count2,1) = features(i,1);
        features2(count2,2) = features(i,2);
        count2 = count2 + 1;
    end
end