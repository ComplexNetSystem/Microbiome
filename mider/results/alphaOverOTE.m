function alphaValue = alphaOverOTE(OTEdata,binAxis)

alphaValue = zeros(1,length(binAxis)-1);

for i = 1:(length(binAxis)-1)
    if i == 1
        alphaValue(i) = length(OTEdata(OTEdata >= binAxis(1) & OTEdata <= binAxis(2))); 
    else
        alphaValue(i) = length(OTEdata(OTEdata >= binAxis(i) & OTEdata <= binAxis(i+1)));
    end  
end
