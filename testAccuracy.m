testIm = imread('test.jpg');
testImN = imread('testN.jpg');
testImC = rgb2ycbcr(testIm);
testImC = testImC(:,:,2:3);
[width,height, ~] = size(testIm);
labeledImage = zeros(width,height);
for i = 1:width
    for j = 1:height
        if testImN(i,j) == 255 && testIm(i,j) ~= 255
            labeledImage(i,j) = 1;
        end
    end
end

[width,height,channel] = size(testImC);
probImage1 = zeros(width,height, 'double');
probImage2 = zeros(width,height, 'double');
tic
evidence = zeros(width,height,'double');
probImage1 = probImage1 * priors(1);
for i = 1:width
    s1 = sum(sum(hist1));
    s = sum(sum(hist));
    for j = 1:height
%         probImage(i,j) = (1/sqrt(2*pi)*variance*exp(((image(i,j,1)-mean(1))^2)/2*variance^2))*(1/sqrt(2*pi)*variance*exp(((image(i,j,2)-mean(1))^2)/2*variance^2))*priors(1);
            probImage1(i,j) = priors(1);
            probImage1(i,j) = (probImage1(i,j)*calculateProb(hist1,testImC(i,j,:),s1))/calculateProb(hist,testImC(i,j,:),s);
           %             calculate other prob, check it's prob
%             evidence = calculateProb(hist2);
%         for k = 1:2
              
%             probImage1(i,j) = probImage1(i,j)*normpdf(image(i,j,k), mean(1,k), stdDev(1,k));%(1/sqrt(2*pi)*stdDev(1,k))*exp(-((pow2(image(i,j,k)-mean(1,k)))/(2*stdDev(1,k)^2)));
%             ans = double(-((image(i,j,k)-mean(1,k))^2)/2*stdDev(1,k)^2); 
%             probImage2(i,j) = probImage2(i,j)*normpdf(image(i,j,k), mean(2,k), stdDev(2,k));%(1/sqrt(2*pi)*stdDev(2,k))*exp(-((pow2(image(i,j,k)-mean(2,k)))/(2*stdDev(2,k)^2)));
%         end
%               evidence(i,j) = probImage1(i,j) + probImage2(i,j); 
%               probImage1(i,j) = probImage1(i,j) / evidence(i,j);
%               probImage2(i,j) = probImage2(i,j) / evidence(i,j);
%               probImage2(i,j) = 1-probImage1(i,j);

    end
end
t = 0.3;
noOfErrors = zeros(12,1);
sum(sum(labeledImage))
count = 1;
confMat = zeros(2,2);
crossIm = zeros(width , height);
for k = 1: 12
    confMat = zeros(2,2);
    resultImage = zeros(width,height);
    for i = 1:width
        for j = 1:height
            if probImage1(i,j) >t
                resultImage(i,j) = 1;%white
            else
                resultImage(i,j) = 0;%black
            end
            
            if (resultImage(i,j) == 1 && labeledImage(i,j) == 0) ||  (resultImage(i,j) == 0 && labeledImage(i,j) == 1)
                noOfErrors(count) = noOfErrors(count) + 1;
                crossIm(i,j) = 1;
            end
            confMat(resultImage(i,j)+1,labeledImage(i,j)+1) = confMat(resultImage(i,j)+1,1+labeledImage(i,j))  + 1;
        end
    end
    
    t = t + 0.05;
    k
    confMat
    noOfErrors(count) = confMat(1,2) + confMat(2,1);
    count = count + 1;
    
end
noOfErrors = noOfErrors  / (width*height);
x = [0.3,0.35,0.4,0.45,0.5,0.55,0.6, 0.65, 0.7, 0.75, 0.8, 0.85];
plot(x,noOfErrors);
xlabel('value of threshold')
ylabel('percentage of errors')