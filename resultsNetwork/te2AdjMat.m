function adjMatrix = te2AdjMat(TE_Data)

TE_Data(logical(eye(size(TE_Data)))) = 0;
TE_Data(TE_Data ~= 0) = 1;
[row,column] = size(TE_Data);
% adjMatrix = zeros(row,column);
for i = 1:row
    for j = 1:column
        if TE_Data(i,j) == 1
            TE_Data(j,i) = 1;
        else
            continue;
        end
    end
end
%% Remove the nodes that do not exist in this graph. 
degreeForEachNode = sum(TE_Data,2);
nonExistNodesIndex = find(degreeForEachNode == 0);
TE_Data(nonExistNodesIndex,:) = [];
TE_Data(:,nonExistNodesIndex) = [];

adjMatrix = TE_Data;