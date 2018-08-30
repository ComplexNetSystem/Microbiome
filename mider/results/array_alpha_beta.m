function [x_axis,y_alpha,y_beta] = array_alpha_beta(arrData)

arrUnique = unique(arrData(arrData ~= 0));

alphaDiversity = zeros(length(arrUnique),1);
betaDiversity = zeros(length(arrUnique),1);

for i = 1:length(arrUnique)
    if i == 1
        index_row = find(arrData >= 0 & arrData <= arrUnique(i));
        speciesIndexCurrent = unique(index_row);
        alphaDiversity(i) = length(speciesIndexCurrent);
        betaDiversity(i) = 0;
        speciesIndexPre = speciesIndexCurrent;clear alphaIndexCurrent
    else
        index_row = find(arrData > arrUnique(i-1) & arrData <= arrUnique(i));
        speciesIndexCurrent = unique(index_row);
        alphaDiversity(i) = length(speciesIndexCurrent);
        
        isMember = ismember(speciesIndexCurrent,speciesIndexPre);
        commonIndexCount = length(find(isMember == 1));
        speciesIndexCount = length(speciesIndexPre) + length(find(isMember == 0));
        betaDiversity(i) = commonIndexCount/speciesIndexCount;
        
        % speciesIndexPre = unique([speciesIndexPre;speciesIndexCurrent]);clear alphaIndexCurrent
        speciesIndexPre = speciesIndexCurrent; clear alphaIndexCurrent
    end
end
x_axis = arrUnique;
y_alpha = alphaDiversity;
y_beta = betaDiversity;