function [newHypotheses, numOfHypotheses] = removeHypotheses(hypotheses, k)

[~, n] = size(hypotheses);
newHypotheses = zeros(6,n-1);
numOfHypotheses = n-1;
count = 1;
for i = 1: numOfHypotheses
    if i ~= k
        newHypotheses(:,count) = hypotheses(:,i);
        count = count + 1;
    end
    
end


