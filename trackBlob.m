[width,height,numOfFrames] = size(video);
objHypotheses = 0;
for f = 1:numOfFrames
    frame = video(:,:,i);
    
    
    test = bwlabel(frame);
    
    hist = getHists(test);
    
    
    numOfBlobs = max(size(hist));
    
    if numOfBlobs > 0
        
        if objHypotheses == 0
            objHypotheses = zeros(6, numOfBlobs);
            for i = 1:numOfBlobs
                features = separateXandY(test,i,hist(i));
                
                covMat = cov(features);
                
                center = getCenter(features);
                
                [d,v] = eig(covMat);
                
                [largestEigvecInd, r] = find(v == max(max(v)));
 
                largestEigvec = d(:, largestEigvecInd);

                largestEigval = max(max(v));
                
                objHypotheses(1,i) = i;
                objHypotheses(2,i) = center(1);
                objHypotheses(3,i) = center(2);
                objHypotheses(4,i) = 2*sqrt(1,1);
                objHypotheses(5,i) = 2*sqrt(2,2);
                objHypotheses(6,i) = asind(largestEigvec(1));
                
            end
        end
        [a,numOfEllipses] = size(objHypotheses);
        for i = 1:width
            for j = 1:height
                distances = zeros(1,numOfEllipses);
                if test(i,j) ~= 0
                    for k = 1:numOfEllipses
                        distances(k) = distance(objHypotheses(:,k), [x,y]);
                    end
                    
                    
                end
            
            end
        end
        
    end
end
