    for i = 1:width
        for j = 1:height
            if im(i,j) ~= 0
                newIm(i,j,im(i,j)) = im(i,j);
            end
        end
    end
    
    for i = 1:2
        figure
        imshow(newIm(:,:,i))
    end