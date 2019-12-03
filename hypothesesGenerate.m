function hypotheses = hypothesesGenerate(im, hypotheses)

 im = bwlabel(im);
    
 hist = getHists(im);
    
    
 numOfBlobs = max(size(hist));
    
 if numOfBlobs > 0
   %if no hypoteses in frame, add them
   if hypotheses == 0
     hypotheses = zeros(6, numOfBlobs);
     for i = 1:numOfBlobs
        features = separateXandY(im,i,hist(i));
                
        covMat = cov(features);
                
        center = getCenter(features);
                
        [d,v] = eig(covMat);
                
        [largestEigvecInd, ~] = find(v == max(max(v)));
 
        largestEigvec = d(:, largestEigvecInd);
                
        hypotheses(1,i) = i;
        hypotheses(2,i) = center(1);
        hypotheses(3,i) = center(2);
        hypotheses(4,i) = 2*sqrt(v(1,1));
        hypotheses(5,i) = 2*sqrt(v(2,2));
        hypotheses(6,i) = asind(largestEigvec(1));
                
     end
   % if there are hypotheses, check if all of them have an object
   else
       [~,numOfHypotheses] = size(hypotheses);
       %if number of blobs bigger than number of hypotheses
       % add new hypothesis
       if numOfBlobs > numOfHypotheses
           hypotheses = addHypotheses(im, hypotheses);
       % if number of hypotheses smaller than number of blobs 
       % find blob and eliminate it
       elseif numOfBlobs < numOfHypotheses
           
       end
       
   end
 end