function [geoDistValue,alphaDiversity] = alphaDiverOverGeoDist(geoDistData)

geoDistData(logical(eye(size(geoDistData)))) = NaN;
geoDistValue = unique(geoDistData); 

geoDistValue = geoDistValue(find(~isnan(geoDistValue)));
geoDistNum = length(geoDistValue);
alphaDiversity = zeros(geoDistNum,1);
for i = 1:geoDistNum
    [m,n] = find(geoDistData == geoDistValue(i));
    alphaDiversity(i) = length(unique([m,n]));
end
