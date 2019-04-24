clear all
outputFile = 'output_Transitory_Group'; load(outputFile);
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_All_Group' or 'output_All_Group_withoutC_C1'
                                % 'output_Transitory_Group'
% alpha diversity over distance.
threshold = threAquire_4_maxTE(Output.T);
teValue = Output.T; teValue(teValue < threshold) = 0;
teValue = abs(teValue)/max(max(abs(teValue))); 

[x_dist,alpha_dist,beta_dist] = alpha_beta_Cal(teValue,Output.dist);
x_dist = x_dist(1:end-1);alpha_dist = alpha_dist(2:end);beta_dist = beta_dist(2:end);
figure;scatter(x_dist,alpha_dist,60,[0,185/255,0],'filled');
xlabel('Distance (Transitory)');ylabel('\alpha Diversity');xlim([0 1]);ylim([0,50]);set(gca,'FontSize',28);
% title('\alpha Diversity over Distance (Healthy)');

alpha_dist_S = [alpha_dist*(-1);alpha_dist];
[alphaAxis,alphaPdenf] = plpdfModify(alpha_dist_S',8,0,100,'Unhealthy MaxEnt'); % H_M 0.09;T_M ;U_M ;

% [alphaAxis,alphaPdenf] = plpdf_Parameter(alpha_dist',1,0,1); 
% title('Hist. & pdf of \alpha Diversity over Distance (Healthy)')

figure;scatter(x_dist,beta_dist,60,[0,185/255,0],'filled');
xlabel('Distance (Transitory)');ylabel('\beta Diversity'); xlim([0 1]);ylim([0,1]);set(gca,'FontSize',28);
% title('\beta Diversity over Distance (Healthy)'); 

beta_dist_S = [beta_dist*(-1);beta_dist];
[betaAxis,betaPdenf] = plpdfModify(beta_dist_S',0.09,0,1,'Unhealthy MaxEnt'); % H_M 0.09;T_M ;U_M ;

% [betaAxis,betaPdenf] = plpdf_Parameter(beta_dist',0.05,0,1); 
% title('Hist. & pdf of \beta Diversity over Distance (Healthy)')
