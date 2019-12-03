function eigenvectors = getEigenvectors(eigenvalues, covMat)

eigenvectors = zeros(2,2);

eigenvectors(2,1) = covMat(2,1);

eigenvectors(1,1) = eigenvalues(2) - covMat(2,2);

denominator = eigenvectors(1,1)^2 + eigenvectors(2,1)^2;

eigenvectors(2,1) = eigenvectors(2,1) / sqrt(denominator);

eigenvectors(1,1) = eigenvectors(1,1) / sqrt(denominator);


eigenvectors(1,2) = covMat(1,2);

eigenvectors(2,2) = eigenvalues(1) - covMat(1,1);

denominator = eigenvectors(1,2)^2 + eigenvectors(2,1)^2;

eigenvectors(1,2) = eigenvectors(1,2) / sqrt(denominator);

eigenvectors(2,2) = eigenvectors(2,2) / sqrt(denominator);
