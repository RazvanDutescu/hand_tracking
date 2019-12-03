function [mean,stdDev] = calculateMeanAndDev(features,labels)


[len , x] = size(features);
sum1 = [0,0];
count1 = 0;
sum2 = [0,0];
count2 = 0;
for i  =1: len
    if labels(i) == 1
        sum1(1,1) = sum1(1,1)+features(i,1);
        sum1(1,2) = sum1(1,2) + features(i,2);
        count1 = count1 + 1;
        
    else
        sum2(1,1) = sum2(1,1) + features(i,1);
        sum2(1,2) = sum2(1,2) + features(i,2);
        count2 = count2 + 1;
    end
end

mean(1,1) = sum1(1,1)/count1;
mean(1,2) = sum1(1,2)/count1;
mean(2,1) = sum2(1,1)/count2;
mean(2,2) = sum2(1,2)/count2;
% mean = sum(features)/len;

%stdDev = std(features);
sum3 = zeros(count1,2);
sum4 = zeros(count2,2);
count3 = 1;
count4 = 1;
for i = 1:len
    if labels(i) == 1
        sum3(count3,1) = features(i,1);
        sum3(count3,2) = features(i,2);
        count3 = count3 +1;
    else
        sum4(count4,1) = features(i,1);
        sum4(count4,2) = features(i,2);
        count4 = count4 + 1;
    end
end

a = std(sum3);
b = std(sum4);

stdDev = [a;b];

% sum3
% count1
% sum4
% count2
% stdDev(1,1) = sum3(1,1) / count1-1;
% stdDev(1,2) = sum3(1,2) / count1-1;
% stdDev(2,1) = sum4(1,1) / count2-1;
% stdDev(2,2) = sum4(1,2) / count2-1;
% 
% stdDev = sqrt(stdDev);