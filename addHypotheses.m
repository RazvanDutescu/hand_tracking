function [newHyp, newPos] = addHypotheses(im, hypotheses, positions)

im = bwlabel(im);

numOfBlobs = max(max(im));
[~,numOfHypotheses] = size(hypotheses);
association = zeros(numOfBlobs, 1);
for i = 1: numOfHypotheses
    int32(hypotheses(3,i))
    int32(hypotheses(2,i))
    association(i) = im(int32(hypotheses(3,i)),int32(hypotheses(2,i)))
end
newHyp = zeros(6,numOfHypotheses +1);
newPos = zeros(2,2,numOfHypotheses + 1);
count = 1;
numOfHypotheses
for i = 1:numOfHypotheses+1 
    i
    if association(i) == 0  %found the blob with no ellipse
        hist = getHists(im);
        features = separateXandY(im,i,hist(i));

        covMat = cov(features);

        center = getCenter(features);

        [d,v] = eig(covMat);

        [largestEigvecInd, ~] = find(v == max(max(v)));

        largestEigvec = d(:, largestEigvecInd);

        newHyp(1,i) = i;
        newHyp(2,i) = center(1);
        newHyp(3,i) = center(2);
        newHyp(4,i) = 2*sqrt(v(1,1));
        newHyp(5,i) = 2*sqrt(v(2,2));
        newHyp(6,i) = asind(largestEigvec(1));
        newPos(1,1,i) = center(1);
        newPos(2,1,i) = center(1);
        newPos(1,2,i) = center(2);
        newPos(2,2,i) = center(2);
    else
        
        newHyp(:,i) = hypotheses(:,count);
        newPos(:,:,i) = positions(:,:,count);
        count = count + 1;
    end
end
