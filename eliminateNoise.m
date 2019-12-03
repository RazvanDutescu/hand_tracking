function newIm = eliminateNoise(im)

labeledImage = bwlabel(im);

hist = getHists(labeledImage);

[width,height] = size(im);


newIm = zeros(width,height);

for i = 1:width
    for j = 1:height
        if labeledImage(i,j) ~= 0
            if (hist(labeledImage(i,j)) > 800)
               newIm(i,j) = 1;
            else
                newIm(i,j) = 0;
            end
        else
            newIm(i,j) = 0;
        end
    end
end  