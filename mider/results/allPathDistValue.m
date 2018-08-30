function allPathsDist = allPathDistValue(adjMat)

numOfNodes = length(adjMat);
allPathsDist = cell(numOfNodes);  % pathbetweennodes
for i = 1:numOfNodes
    if i == numOfNodes
        continue;
    else
        for j = (i+1) : numOfNodes
            pathCell = pathbetweennodes(adjMat,i,j);
            allPathsDist{i,j} = pathCell2distMat(pathCell);
        end
    end   
end

%% Count geometrical distances based on the list of calculated paths.
function distMat = pathCell2distMat(path)

numOfPath = length(path);
distMat = zeros(numOfPath,1);
for i = 1:numOfPath
    distMat(i) = length(path{i}) - 1;
end

