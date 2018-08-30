function [x_distance,y_alpha,y_beta] = alpha_beta_Cal(te_label,Output_dist)

te_label(te_label ~= 0) = 1;
distBetweenNodes = te_label .* Output_dist;

% Set the elments in diagonal line 0. Only for NxN Matrix.
distBetweenNodes = distBetweenNodes - diag(diag(distBetweenNodes));

edgesDistSeries = unique(distBetweenNodes(distBetweenNodes ~= 0));

alphaDiversity = zeros(length(edgesDistSeries),1);
betaDiversity = zeros(length(edgesDistSeries),1);

for i = 1:length(edgesDistSeries)
    if i == 1
        [index_row,index_column] = find(distBetweenNodes >= 0 & distBetweenNodes <= edgesDistSeries(i));
        speciesIndexCurrent = unique([index_row;index_column]);
        alphaDiversity(i) = length(speciesIndexCurrent);
        betaDiversity(i) = 0;
        speciesIndexPre = speciesIndexCurrent;clear alphaIndexCurrent
    else
        [index_row,index_column] = find(distBetweenNodes > edgesDistSeries(i-1) & distBetweenNodes <= edgesDistSeries(i));
        speciesIndexCurrent = unique([index_row;index_column]);
        alphaDiversity(i) = length(speciesIndexCurrent);
        
        isMember = ismember(speciesIndexCurrent,speciesIndexPre);
        commonIndexCount = length(find(isMember == 1));
        speciesIndexCount = length(speciesIndexPre) + length(find(isMember == 0));
        betaDiversity(i) = commonIndexCount/speciesIndexCount;
        
        % speciesIndexPre = unique([speciesIndexPre;speciesIndexCurrent]);clear alphaIndexCurrent
        speciesIndexPre = speciesIndexCurrent; clear alphaIndexCurrent
    end
    
end

x_distance = edgesDistSeries;
y_alpha = alphaDiversity;
y_beta = betaDiversity;

