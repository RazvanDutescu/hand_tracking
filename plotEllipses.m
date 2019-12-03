function plotEllipses(im, hypotheses, numOfBlobs)

imshow(im);
hold on;
[~,numOfHypotheses] = size(hypotheses)


for i = 1:numOfHypotheses
 
    p = calculateEllipse(hypotheses(2,i),hypotheses(3,i),hypotheses(4,i),hypotheses(5,i),hypotheses(6,i));
    
     plot(p(:,1), p(:,2), '.-'), axis equal
     
end
saveas(gcf, 'temp', 'png');
hold off