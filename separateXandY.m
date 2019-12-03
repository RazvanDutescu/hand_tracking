function [positions] = separateXandY(labeledImage, label, numOfElements)
    
    positions = zeros(numOfElements,2);
    
    count = 1;
    
    [width,height] = size(labeledImage);
    
    for i = 1:width
        for j = 1:height
            if labeledImage(i,j) == label
                positions(count,1) = j;
                positions(count,2) = i;
                count = count + 1;
            end
        end
    end
    
end