function [covMat,Cx,Cy] = covarianceMat(image)


[width,height] = size(image);

%N = sum(sum(image))/max(max(image));
covMat = zeros(2,2,'int32');
N = 0;
Cx = 0;
Cy = 0;
for i = 1:width
    for j = 1:height
        if image(i,j) ~= 0
            Cx = Cx + i;
            Cy = Cy + j;
            N = N +1;
         end
    end
end

Cx = Cx / N;

Cy = Cy / N;

%Cx = Cx);

%Cy = int16(Cy);

for i = 1:width
    for j = 1:height
        if image(i,j) ~= 0
            covMat(1,1) = covMat(1,1) + (i - Cx)*(i - Cx);
            covMat(1,2) = covMat(1,2) + (i - Cx)*(j - Cy);
            covMat(2,1) = covMat(1,2);
            covMat(2,2) = covMat(2,2) + (j - Cy)*(j - Cy);
        end
    end
end
covMat = covMat ./ N;