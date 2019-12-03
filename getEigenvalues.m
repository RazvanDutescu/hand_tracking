function eigenvalues = getEigenvalues(covMat)

lambda = sqrt(trace(covMat)^2 - 4*det(covMat));

eigenvalues = zeros(2,2);

eigenvalues(1,1) = (trace(covMat) + lambda)/2;

eigenvalues(2,2) = (trace(covMat) - lambda)/2;