%trainScript

%  test = imread('2BlobsTest.png');

% test = rgb2ycbcr(test);
% 
% test = test(:,:,2:3);

% hist = calculateHistogram(features);
% 
% [f1,f2] = separateFeatures(features,labels);
% 
% hist1 = calculateHistogram(f1);
% 
% hist2 = calculateHistogram(f2);
% 
% [test,prob] = classifyImage(A,priors,hist1,hist2,hist);

%test = test(:,:,1);
[width, height] = size(test);
%  for i = 1:width
%      for j = 1:height      
%          if test(i,j,1) == 255
%              test(i,j) = 0;
%          else
%              test(i,j) = 1;
%          end
%      end
%  end

test = bwlabel(test);

imshow(test)
hold on

hist = getHists(test)

numOfBlobs = max(size(hist));

covMat = zeros(2,2,3);

center = zeros(numOfBlobs, 2);
% numOfBlobs = 1;

for i = 1:numOfBlobs
    hist(i);
    features = separateXandY(test,i,hist(i));
    covMat(:,:,i) = cov(features);
    center(i,:) = getCenter(features);
    plot(center(i,1), center(i,2),'+r')
end

for i = 1:numOfBlobs
    [d,v] = eig(covMat(:,:,i));

    plot([center(i,1),center(i,1)+d(1,1)*sqrt(v(1,1))], [center(i,2), center(i,2)+d(1,2)*sqrt(v(1,1)),] ,'r')
    plot([center(i,1),center(i,1)+d(2,1)*sqrt(v(2,2))], [center(i,2), center(i,2)+d(2,2)*sqrt(v(2,2))], 'y' )

     [largestEigvecInd, r] = find(v == max(max(v)));
 
     largestEigvec = d(:, largestEigvecInd);

     largestEigval = max(max(v));
%     alpha = covMat(1,1,i) + covMat(2,2,i) + sqrt(abs(pow2(covMat(1,1,i)-covMat(2,2,i)) - 4*pow2(covMat(1,2,i))));
%     
%     beta = covMat(1,1,i) + covMat(2,2,i) - sqrt(abs(pow2(covMat(1,1,i)-covMat(2,2,i)) - 4*pow2(covMat(1,2,i))));
    largestEigvec(2)
    
    largestEigvec(1)

    theta = asind(largestEigvec(1));

   
%     theta = theta;

    p = calculateEllipse(center(i,1),center(i,2),2*sqrt(v(1,1)),2*sqrt(v(2,2)),theta);

     plot(p(:,1), p(:,2), '.-'), axis equal
end
    

