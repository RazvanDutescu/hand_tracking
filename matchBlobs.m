function labeledIm = matchBlobs(thisFrame, prevFrame)

[width,height] = size(thisFrame);
thisFrame = bwlabel(thisFrame);
labeledIm = zeros(width,height);
association = zeros(max(max(thisFrame)), 1);
for i = 1:width
    for j = 1:height
        if thisFrame(i,j) ~= 0
            if  prevFrame(i,j) ~= 0
                association(thisFrame(i,j)) = prevFrame(i,j);
            end
        end
    end
end
if max(max(thisFrame)) > max(max(prevFrame))
    association(max(max(thisFrame))) = max(max(thisFrame));
end

for i = 1:width
    for j = 1:height
        if thisFrame(i,j)~= 0
            labeledIm(i,j) = association(thisFrame(i,j));
        end
    end
end
%labeledIm = bwlabel(labeledIm);