function shrtPathMatrix = shrtPathMat(sparseMat,nodesNum)

shrtPathMatrix = zeros(nodesNum);
for i = 1:nodesNum
    shrtPathMatrix(i,:) = graphshortestpath(sparseMat,i);
end
