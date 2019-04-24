function clusteringCoeff = clustCoeff(interValue)
% interValue is Transfer Entropy Data

[nrows,ncols] = size(interValue);

ccMat = zeros(nrows,2); % 1 --> neighbor nodes; 2 --> edges between these nodes

% Set diagonal line value non-zero.
interValue(logical(eye(size(interValue)))) = 100; % 100 --> arbitrary nonzero value
interValueBackup = interValue;% Backup for interValue

for m = 1 : nrows
    interValue = interValueBackup;
    nodesIndex = find(interValue(m,:) ~= 0);
    zerosIndex = find(interValue(m,:) == 0);
    numOfZeros = length(zerosIndex);
    if numOfZeros == 0
        numOfNeighbors = ncols - 1;
    else
        numOfNeighbors = ncols - 1 - numOfZeros;
        for i = 1:numOfZeros
            if interValue(zerosIndex(i),m) ~= 0
                numOfNeighbors = numOfNeighbors + 1;
                nodesIndex = [nodesIndex,zerosIndex(i)];
            end
        end
    end
    ccMat(m,1) = numOfNeighbors * (numOfNeighbors-1);
    
    nodesIndex = nodesIndex(find(nodesIndex ~= m)); %% Delete x-->x
    % Reference
    referIndex = [1:1:nrows]; referIndex = referIndex(find(referIndex ~= m));
    if numOfNeighbors == ncols - 1
        interValue(m,:) = [];interValue(:,m) = [];
        numOfEdges_Neighbors = length(interValue(interValue ~= 0)) - size(interValue,1);
    else 
        memberArr = ismember(referIndex,nodesIndex);
        nonMemberIndex = find(memberArr == 0);
        missNodesNum = length(nonMemberIndex);
        for j = 0:missNodesNum-1
            missNodes = referIndex(nonMemberIndex(missNodesNum));
            interValue(missNodes-j,:) = [];interValue(:,missNodes-j) = [];
        end
        numOfEdges_Neighbors = length(interValue(interValue ~= 0)) - size(interValue,1);
    end
    
    ccMat(m,2) = numOfEdges_Neighbors;
end
clusteringCoeff = ccMat(:,2) ./ ccMat(:,1);
% if there are any NaNs, Delete them.
clusteringCoeff = clusteringCoeff(~isnan(clusteringCoeff));

