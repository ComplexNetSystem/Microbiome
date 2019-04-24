clear all
%% Failed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!to calculate all paths (geo distance)
numOfNodes = 5;

graphAdjMatrix = [0 0 0 1 0;0 0 1 1 0;0 1 0 1 0;1 1 1 0 1;0 0 0 1 0];

% A = rand(numOfNodes);
% graphAdjMatrix = tril(A,-1)+triu(A',0); clear A
% graphAdjMatrix(logical(eye(size(graphAdjMatrix)))) = 0;
% graphAdjMatrix(graphAdjMatrix < 0.5) = 0;graphAdjMatrix(graphAdjMatrix >= 0.5) = 1; 
h = view(biograph(sparse(graphAdjMatrix),[],'ShowArrows','off','ShowWeights','on'));
% graphAdjMatrix = [0 1 0 0 0 0;1 0 1 0 0 0;0 1 0 1 0 1;0 0 1 0 1 0;0 0 0 1 0 0;0 0 1 0 0 0];
% [dist,path,pred] = graphshortestpath(sparse(graphAdjMatrix),1);
% alphaOverGeoDistance = alphaOverGeoDistDiameter(graphAdjMatrix);
shrtPathMatrix = shrtPathMat(sparse(graphAdjMatrix),numOfNodes);
[value,alphaOverShrtDist] = alphaDiverOverGeoDist(shrtPathMatrix);
% allPathsDistCell = allPathCell(graphAdjMatrix);
 scatter(value,alphaOverShrtDist,80,[1 0.1 0.7],'filled');xlim([0 5]);ylim([0 150])