function [histo] = calculateHistogram(features)



a = max(features);

histo = ones(255, 255);

for i  =1:length(features)
    histo(features(i,1), features(i,2)) = histo(features(i,1), features(i,2)) + 1;
%     hist(features(i,2), 2) = hist(features(i,2), 2) + 1;
end

