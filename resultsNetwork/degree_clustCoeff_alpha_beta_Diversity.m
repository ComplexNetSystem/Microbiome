% clear all
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
csvEdgesFileName = 'temp.csv';
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_All_Group' or 'output_All_Group_withoutC_C1'
                                % 'output_Transitory_Group'
threshold = threAquire_4_maxTE(Output.T);
teValue = Output.T; teValue(teValue < threshold) = 0;
teValue = abs(teValue)/max(max(abs(teValue))); 

[fidEdges,index,degreeNetworks] = edges2csv(csvEdgesFileName,teValue); delete temp.csv
clusteringCoefficient = clustCoeff(teValue);

% beta Diversity must be 0.
[x_degree,alpha_degree,beta_degree] = array_alpha_beta(degreeNetworks(:,3));
% x_degree = x_degree(1:end-1);alpha_degree = alpha_degree(2:end);beta_degree = beta_degree(2:end);
[x_clucoeff,alpha_clucoeff,beta_clucoeff] = array_alpha_beta(clusteringCoefficient);
% x_clucoeff = x_clucoeff(1:end-1);alpha_clucoeff = alpha_clucoeff(2:end);beta_clucoeff = beta_clucoeff(2:end);

figure;scatter(x_degree,alpha_degree,60,'r','filled');
xlabel('Degree (Unhealthy)');ylabel('\alpha Diversity');xlim([0,210]);ylim([0,20]);set(gca,'FontSize',28);
% title('\alpha Diversity over Degree (Transitory)');

[alpha_degreeAxis,alpha_degreePdenf] = plpdf_Parameter(alpha_degree',1.2,0,20,'Healthy MaxEnt'); % H_M 1.2;T_M 1;U_M 1.5;
set(gca,'FontSize',28);

figure;scatter(x_clucoeff,alpha_clucoeff,60,'filled');
xlabel('Clustering Coefficient (Healthy MaxEnt)');ylabel('\alpha Diversity');xlim([0.5,0.72]);set(gca,'FontSize',28);

[alpha_cluCoeffAxis,alpha_cluCoeffPdenf] = plpdf_Parameter(alpha_clucoeff',1,0,20,'Healthy MaxEnt'); % H_M 1;T_M 1;U_M 2;
set(gca,'FontSize',28);