function center = getCenter(features)
s = sum(features);

sz = size(features);

center(1) = s(1)/sz(1);

center(2) = s(2)/sz(1);
