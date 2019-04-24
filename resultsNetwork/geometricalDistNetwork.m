% clear all
outputFile = 'output_Transitory_Group'; load(outputFile);
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_All_Group' or 'output_All_Group_withoutC_C1'
                                % 'output_Transitory_Group'
%% Acquire threshold for Maximum Transfer Entropy.
threshold = threAquire_4_maxTE(Output.T);% Display DataCursors: alldatacursors = findall(gcf,'type','hggroup');set(alldatacursors,'FontSize',28)
HighThreshold = max(max(Output.T)) - max(max(Output.T))/5;
LowThreshold = min(min(Output.T)) - min(min(Output.T))/5;
%% Normalization.
teValue = Output.T; teValue(teValue < HighThreshold) = 0;  %%  Modify Threshold Here.
teValue = abs(teValue)/max(max(abs(teValue)));
speciesNum = size(teValue,1);

graphAdjMatrix = te2AdjMat(teValue); 
% 
% figure;
% StrDegree = sum(graphAdjMatrix,2);   %%  Geometrical Degree or Structural Degree
% [StrDegreeAxis,StrDegreePdenf] = plpdf_Parameter1(StrDegree',2,'b','o'); 

% allPathsDistCell = allPathCell(graphAdjMatrix);

shrtPathMatrix = shrtPathMat(sparse(graphAdjMatrix),length(graphAdjMatrix));
% h = view(biograph(sparse(graphAdjMatrix),[],'ShowArrows','off','ShowWeights','on'));
% [geoDistValue,alphaDiversity] = alphaDiverOverGeoDist(allPairPathCell);
figure;
[value,alphaOverShrtDist] = alphaDiverOverGeoDist(shrtPathMatrix);
scatter(value,alphaOverShrtDist,80,'r','filled');% xlim([0 5]);ylim([0 150])
xlabel('Shortest Distance');ylabel('\alpha Diversity');set(gca,'FontSize',28)

% xlabel('Geometric Distance');ylabel('\alpha Distance');
% set(gca,'FontSize',28)