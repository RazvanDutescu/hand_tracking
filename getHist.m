function hist = getHists(labeledImage)
    a = max(max(labeledImage));
    
    hist = zeros(a,1);
    
    [width,height] = size(labeledImage);
    
    for i = 1:width
        for j = 1:height
            if(labeledImage(i,j) ~= 0)
                hist(labeledImage(i,j)) = hist(labeledImage(i,j)) + 1;
            end
        end
    end
end