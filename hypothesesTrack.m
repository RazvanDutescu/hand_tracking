function hypotheses = hypothesesTrack(im, hypotheses)


[~,numOfHypotheses] = size(hypotheses);

[width,height] = size(im);

distances = zeros(width, height, numOfHypotheses);


for k = 1:numOfHypotheses
    distances(:,:,k) = distance(hypotheses(:,k) , im);
end
%hypotheses(1,:) = 0;
for i = 1:numOfHypotheses
    if hypotheses(1,k) > 0
        hypotheses(1,k) = 0;
    end
end

newIm = zeros(width,height);

for i = 1:width
    for j = 1:height
        if im(i,j) ~= 0 && min(distances(i,j,:)) > 1
            [~,newIm(i,j)] = min(distances(i,j,:));
%         elseif min(distances(i,j,:)) < 1
%             min(distances(i,j,:))
        end
    end
end

for k = 1:numOfHypotheses
    
    a = 0;
    for i = 1:width
        for j = 1:height
            if im(i,j) ~= 0 && distances(i,j,k) < 1 %pixel inside an ellipse
                newIm(i,j) = k;
                a = 1;
            end
        end
    end
    if a == 1
        hist = getHists(newIm);
        features = separateXandY(newIm,k,hist(k));

        covMat = cov(features);

        center = getCenter(features);

        [d,v] = eig(covMat);

        [largestEigvecInd, ~] = find(v == max(max(v)));

        largestEigvec = d(:, largestEigvecInd);

        hypotheses(1,k) = k;
        hypotheses(2,k) = center(1);
        hypotheses(3,k) = center(2);
        hypotheses(4,k) = 2*sqrt(v(1,1));
        hypotheses(5,k) = 2*sqrt(v(2,2));
        hypotheses(6,k) = asind(largestEigvec(1));
    else
        [hypotheses, numOfHypotheses] = removeHypotheses(hypotheses, k);
    end
    
end


% for i = 1:width
%      for j = 1:height
%         [h,index] = min(distances(i,j,:));
%             if h < 1
%                 if hypotheses(1,index) == 0
%                     hypotheses(1,index) = im(i,j);
%                 else
% %                     deal with it
%                 end
%             end
%     end
% end
% 
% % for i = 1:width
% %     for j = 1:height
% %         for k = 1:numOfHypotheses
% %             if im(i,j) ~= 0
% %                 d = distance(hypotheses(:,k),[j,i]);
% %                 distances(i,j,k) = sqrt(d * d');
% %             else
% %                 distances(i,j,k) = 9999999;
% %             end
% %         end
% %         
% %          [h,index] = min(distances(i,j,:));
% %             if h < 1
% % %                 if hypotheses(1,index) == 0
% %                     hypotheses(1,index) = im(i,j);
% % %                 else
% %                     %deal with it
% % %                 end
% %             end
% %     end
% % end
% 
% hist = getHists(im);
%     
%     
%  numOfBlobs = max(size(hist));
%  
%  for i = 1:numOfBlobs
%         features = separateXandY(im,i,hist(i));
%                 
%         covMat = cov(features);
%                 
%         center = getCenter(features);
%                 
%         [d,v] = eig(covMat);
%                 
%         [largestEigvecInd, ~] = find(v == max(max(v)));
%  
%         largestEigvec = d(:, largestEigvecInd);
%                 
%         hypotheses(1,i) = i;
%         hypotheses(2,i) = center(1);
%         hypotheses(3,i) = center(2);
%         hypotheses(4,i) = 2*sqrt(v(1,1));
%         hypotheses(5,i) = 2*sqrt(v(2,2));
%         hypotheses(6,i) = asind(largestEigvec(1));
%                 
%  end

% hypotheses(1,:) = 0;
% %for k = 1:numOfHypotheses
%     for i = 1:width
%         for j = 1:height
%             [h,index] = min(distances(i,j,:));
%             if h < 1
%                 if hypotheses(1,index) == 0
%                     hypotheses(1,index) = im(i,j);
%                 else
%                     %deal with it
%                 end
%             end
%         end
%     end
% % %end

% for i = 1:width
%     for j = 1:height
%         if im(i,j) ~= 0
%             d = distance(hypotheses(:,1),[j,i]);
%             d = sqrt(d*d');
%             minDist = d;
%             min  = 1;
%             for k = 1:numOfHypotheses
%                 d(k) = distance(hypotheses(:,k),[j,i]);
%                 d = sqrt(d*d');
%                 if d < minDist
%                     minDist = d;
%                     min = k;
%                 end
%             end
%             trackIm(i,j) = min;
%         else
%             trackIm(i,j) = 0;
%         end
%     end
%     
% end