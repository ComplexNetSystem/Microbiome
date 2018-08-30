function [hVectorCut,pVectorCut] = shortCut(hVector,pVector)

if length(hVector) > length(pVector)
    hVectorCut = hVector(1:length(pVector));
    pVectorCut = pVector;
elseif length(hVector) < length(pVector)
    hVectorCut = hVector;
    pVectorCut = hVector(1:length(hVector));
elseif length(hVector) == length(pVector)
    hVectorCut = hVector;
    pVectorCut = pVector;
end
