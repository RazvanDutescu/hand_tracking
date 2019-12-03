function positions = getPositions(hypotheses)

[~, numOfHyp] = size(hypotheses);

positions = zeros(2,2,numOfHyp);

for i = 1:numOfHyp
    positions(1,1,i) = hypotheses(2,i);
    positions(1,2,i) = hypotheses(3,i);
end