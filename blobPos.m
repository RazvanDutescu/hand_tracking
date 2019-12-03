function [positions] = blobPos(image, blob)

s = sum(sum(image))/blob;

[width,height] = size(image);
k = 1;
positions = zeros(s,2);
for i = 1:width
    for j = 1:height
        if image(i,j) == blob
            positions(k,1) = i;
            positions(k,2) = j;
            k = k +1;
        end
    end
end