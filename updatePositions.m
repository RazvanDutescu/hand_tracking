function positions = updatePositions(positions, hypotheses)

[~, numOfHyp] = size(hypotheses);

for i = 1:numOfHyp
    positions(2,1,i) = positions(1,1,i);
    positions(2,2,i) = positions(1,2,i);
    positions(1,1,i) = hypotheses(2,i);
    positions(1,2,i) = hypotheses(3,i);
end