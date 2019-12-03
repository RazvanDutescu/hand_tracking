function [priors] = calculatePriors(labels)

len = size(labels);
priors = zeros(2,1);
for i  =1 :len(1)
    priors(labels(i)+1,1) =  priors(labels(i)+1,1) +1;
end

 priors(1) = priors(1) / len(1);
 priors(2) = priors(2) / len(1);