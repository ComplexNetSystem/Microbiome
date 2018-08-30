clear all

csvNodesFileName = 'Nodes_MaxEnt_UnHealthy.csv';csvEdgesFileName = 'Edges_MaxEnt_UnHealthy.csv';
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_All_Group' or 'output_All_Group_withoutC_C1'
                                % 'output_Transitory_Group'
%% Acquire threshold for Maximum Transfer Entropy.
threshold = threAquire_4_maxTE(Output.T,Output.H);% Display DataCursors: alldatacursors = findall(gcf,'type','hggroup');set(alldatacursors,'FontSize',28)
HighThreshold = max(max(Output.T)) - max(max(Output.T))/5;
LowThreshold = min(min(Output.T)) - min(min(Output.T))/5;
%% Normalization.
teValue = Output.T; teValue(teValue < threshold) = 0;  %%  Modify Threshold Here.
teValue = abs(teValue)/max(max(abs(teValue))); 

%% Distance for each edge.
edgesDistSeries = distEdges(teValue,Output.dist);

figure;eX = eprob(edgesDistSeries); 
[alpha, xmin, L] = plfit(edgesDistSeries);hold on
plplotModify(edgesDistSeries, xmin, alpha);
xlabel('Distance');ylabel('EPDF');title(['EPDF of Distance (Healthy MaxEnt)','(\alpha = ',num2str(alpha),')']);set(gca,'FontSize',28);

[distAxis,distPdenf] = plpdf_Parameter(edgesDistSeries',0.16,0,1,'Healthy MaxEnt'); 
% H_M 0.16; T_M 0.2;U_M 0.15;
% H_H 0.085;T_H 0.1;U_H 0.15;
% title('Hist. & pdf of Distance in MaxEnt Network (Transitory)')

%% edges2csv():    can do following issues:
% 1. Write Edges.csv For Gephi,
% 2. How many nodes which are contained in this network.
% 3. degree count. degreeNetworks(:,1) --> OUT Degree;
%                  degreeNetworks(:,2) --> IN degree;
%                  degreeNetworks(:,3) --> Degree
[fidEdges,index,degreeNetworks] = edges2csv(csvEdgesFileName,teValue);

% degreeNetworks_S = [degreeNetworks*(-1);degreeNetworks];
% [degreeAxis,degreePdenf] = plpdfModify((degreeNetworks_S(:,3)/2)',0.8,0,60);

[degreeAxis,degreePdenf] = plpdf_Parameter((degreeNetworks(:,3))',5,0,210,'Healthy MaxEnt'); 
% H_M 5;T_M 14;U_M 9;
% H_H 6;T_H 2;U_H 2.4;
% title('Hist. & pdf of Degree in MaxEnt Network (Transitory)')

%% Write Nodes.csv For Gephi, Obtain nodes based on whether edges exist or not --> index.
ShannonEntropy = Output.H/max(Output.H);
fidNodes = nodes2csv(csvNodesFileName,variables,ShannonEntropy,teValue,index);

%% Clustering Coefficient.
clusteringCoefficient = clustCoeff(teValue);
[ccAxis,ccPdenf] = plpdf_Parameter(clusteringCoefficient',0.04,0,1,'Healthy MaxEnt'); 
% H_M 0.04;T_M 0.008;U_M 0.007;
% H_H 0.02;T_H 0.03;U_H 0.002;
% clusteringCoefficient = [clusteringCoefficient*(-1);clusteringCoefficient];
% [ccAxis,ccPdenf] = plpdfModify(clusteringCoefficient',0.002,0,1); 


% title('Hist. & pdf of Clu-Coeff in MaxEnt Network (Transitory)')

                                % 'output_Healthy_A' --> 'Nodes_MaxEnt_A.csv'  'Edges_MaxEnt_A.csv'
                                % 'output_Healthy_B'      ......
                                % 'output_Healthy_C'
                                % 'output_Healthy_C1'
                                % 'output_Unhealthy_D'
                                % 'output_Unhealthy_E'
