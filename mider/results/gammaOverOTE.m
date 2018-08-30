function gammaValue = gammaOverOTE(OTEdata,binAxis)

gammaValue = zeros(1,length(binAxis)-1);

for i = 1:(length(binAxis)-1)
    gammaValue(i) = length(OTEdata(OTEdata >= binAxis(1) & OTEdata <= binAxis(i+1))); 
end