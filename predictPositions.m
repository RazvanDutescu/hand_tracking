function hypotheses = predictPositions(positions, hypotheses)

[~,~,numOfBlobs] = size(positions);

for i = 1:numOfBlobs
%     hypotheses(2,i) = positions(1,1,i) + abs(positions(1,1,i) - positions(2,1,i));
%     hypotheses(3,i) = positions(1,2,i) + abs(positions(1,2,i) - positions(2,2,i));
    hypotheses(2:3,i) = positions(1,:,i) + (positions(1,:,i) - positions(2,:,i));
end