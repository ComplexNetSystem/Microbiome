clear all
load myColorBar64
segdupFileName = 'segdup.species.txt';karyotypeFileName = 'karyotype.species.txt';
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_Transitory_Group'
%% Acquire threshold for Maximum Transfer Entropy.
threshold = threAquire_4_maxTE(Output.T);% Display DataCursors: alldatacursors = findall(gcf,'type','hggroup');set(alldatacursors,'FontSize',28)
HighThreshold = max(max(Output.T)) - max(max(Output.T))/5;
LowThreshold = min(min(Output.T)) - min(min(Output.T))/5;
%% Normalization.
teValue = Output.T; teValue(teValue < threshold) = 0;  %%  Modify Threshold Here.
[index,degreeNetworks] = degreeForNodeIndex(teValue);
%% edges2csv():    can do following issues:
% 1. Write Edges.csv For Gephi,
% 2. How many nodes which are contained in this network.
% 3. degree count. degreeNetworks(:,1) --> OUT Degree;
%                  degreeNetworks(:,2) --> IN degree;
%                  degreeNetworks(:,3) --> Degree

% [fidEdges,index,degreeNetworks]fidEdges = segdup2txt(segdupFileName,Output.H,teValue);
degree = degreeNetworks(:,3);

fidNodes = karyo2txt(karyotypeFileName,variables,degree,mycmap_test,Output.H,index);

fidEdges = segdup2txt(segdupFileName,teValue,mycmap_test,degree,index);







