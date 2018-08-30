function alphaOverGeoDistance = alphaOverGeoDistDiameter(adjMat)

[row,column] = size(adjMat);
% The maximum lenght equals to the number of nodes.
alphaOverGeoDistance = zeros(row,column - 1);
% alphaOverGeoDistance(1) = length(find(alphaOverGeoDistance == 1))/2;
for i = 1:row   % species
    for dist = 1:column - 1
        alphaOverGeoDistance(i,dist) = alpha4eachNode4Dist(adjMat,dist,i);
    end
end
% cbn --> combine

function alphaNodeDist = alpha4eachNode4Dist(adjMat,dist,nodeIndex)

alphaNodeDist = 0;
cbnSpecies = nchoosek((1:row),dist + 1); % dist --> number of nodes = dist + 1
cbnSpecies = cbnSpecies(find(cbnSpecies(:,1) == nodeIndex),:);

for j = 1:size(cbnSpecies,1)
    % if ismember(nodeIndex,cbnSpecies(j,:)) && sum(cbnSpecies(j,:) > nodeIndex)
    adjMat_Focus = adjMat(cbnSpecies(j,:),:);
    alphaEachCbn = alpha4eachCbn(adjMat_Focus,cbnSpecies(j,:));
    alphaNodeDist = alphaNodeDist + alphaEachCbn;
end   
end


function alphaEachCbn = alpha4eachCbn(focusedDistMat,cbnIndex)
    
CurrentConnnectSpeciesIndex = find(focusedDistMat(1,(cbnIndex(1)+1):end) == 1) + cbnIndex(1);
for jj = 2:length(cbnIndex)
    if ismember(cbnIndex(jj),CurrentConnnectSpeciesIndex)
        CurrentConnnectSpeciesIndex = find(focusedDistMat(jj,(cbnIndex(jj)+1):end) == 1) + cbnIndex(jj);
        numOfConnected = length(CurrentConnnectSpeciesIndex);
        alphaEachCbn = length(cbnIndex) - 1 + numOfConnected;
        % PreConnnectSpeciesIndex = CurrentConnnectSpeciesIndex;
    % connnectSpeciesIndex = find(focusedDistMat(jj,(cbnIndex(jj)+1):end) == 1) + cbnIndex(jj);
    else
        alphaEachCbn = 0;
        break;
    end
end


end

end

