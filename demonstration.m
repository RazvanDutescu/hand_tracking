imshow('Faces/Face1.jpg');
figure
imshow('Faces/Face1N.jpg');

pause

A = imread('frame.jpg');

imshow(A);

A = rgb2ycbcr(A);

A = A(:,:,2:3);

trainScript

test = classifyImage(A, priors, hist1,hist2,hist);
pause
imshow(test)


plotElipseInFrame
pause
A = 'blobTest.avi';
trackVideo
figure
A = 'demoBlobs.avi';
trackVideo
figure
% A = 'blobRotation.avi';
% trackVideo
% pause
A = '2Blobs.avi';
trackVideo


