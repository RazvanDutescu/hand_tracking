function center = centerOfBlob(features)

s = sum(features);

sz = size(features);

if(sz(1) == 1 || sz(2) == 1)
     center(1) = features(1);
     center(2) = features(2);
    
else

center(1) = s(1)/sz(1);
 center(2) = s(2)/sz(1);
 
end