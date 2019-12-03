function [alpha,beta, theta] = calculateEllipsePoints(covMat)


CLambda = sqrt(double(((covMat(2,2) - covMat(1,1))^2)) + 4* double(((covMat(1,2)^2))))

lambda1 = (covMat(1,1) + covMat(2,2) - CLambda)/2

lambda2 = (covMat(1,1) + covMat(2,2) + CLambda)/2

alpha = sqrt(double(lambda1));

beta = sqrt(double(lambda2));

theta = tan(double((covMat(1,2)* -1)/lambda1 - covMat(1,1))) ^ -1;