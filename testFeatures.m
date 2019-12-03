im = imread('Image3.jpg');
imN = imread('ImageNegative3.jpg');

im3 = convertImage(im);

[fIm,lIm] = labelImage(im3,im,imN);

[f,l]  = generateFeatureMatrix(fIm, lIm);

s = size(features);
[width,height,channel]  =size (im3)
outputImage = zeros(width,height);
tic
for i = 1: width
    tic
    for j = 1:height
        dataP(1) = im3(i,j,1);
        dataP(2) = im3(i,j,2);
        output = knnclassify(dataP, features, labels);
        outputImage(i,j) = output;  
    end
    toc
end
toc

imshow(outputImage);
figure;

tic
for i = 1: width
    for j = 1:height
        dataP(1) = im3(i,j,1);
        dataP(2) = im3(i,j,2);
        output = knearest(3,dataP, features, labels);
        outputImage(i,j) = output;
    
    end
end
toc

imshow(outputImage);
figure;
tic
for i = 1: width
    for j = 1:height
        dataP(1) = im3(i,j,1);
        dataP(2) = im3(i,j,2);
        output = knearest(5,dataP, features, labels);
        outputImage(i,j) = output;
    
    end
end
toc

imshow(outputImage);
figure;

