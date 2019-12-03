function dist = distance(ellipse, Im)

% dist(1) = (Im(1) - ellipse(2))/ellipse(4);
% dist(2) = (Im(2) - ellipse(3))/ellipse(5);
% 
% mat = [cos(ellipse(6)) , -sin(ellipse(6)) ; sin(ellipse(6)) , cos(ellipse(6))];
% 
% dist = dist * mat;
% 
% dist = sqrt(dist*dist');

[width,height] = size(Im);
dist = zeros(width,height);

for i = 1:width
    for j = 1:height
        if Im(i,j) ~= 0
            a = ([j;i] - ellipse(2:3)) ./ ellipse(4:5);
            dist(i,j) = sqrt(a' * a);
        else
            dist(i,j) = 999999;
        end
    end
end


