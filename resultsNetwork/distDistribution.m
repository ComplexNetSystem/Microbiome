clear all
                                  % 'output_Healthy_A'        
                                  % 'output_Healthy_B'
                                  % 'output_Healthy_C'
                                  % 'output_Healthy_C1'
                                  % 'output_Unhealthy_D'
                                  % 'output_Unhealthy_E'
%% For Healthy Individuals
outputFile = 'output_Healthy_A'; load(outputFile);
H1DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

outputFile = 'output_Healthy_B'; load(outputFile);
H2DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

outputFile = 'output_Healthy_C'; load(outputFile);
H3DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

outputFile = 'output_Healthy_C1'; load(outputFile);
H4DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

H_DistArr = [H1DistArr,H2DistArr,H3DistArr,H4DistArr];
[H_DistAxis,H_DistPdenf] = plpdf(H_DistArr); title('Histogram For Distance (Healthy)')
%% For Unhealthy Individuals
outputFile = 'output_Unhealthy_D'; load(outputFile);
P1DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

outputFile = 'output_Unhealthy_E'; load(outputFile);
P2DistArr = reshape(Output.dist,1,size(Output.dist,1)*size(Output.dist,2));

P_DistArr = [P1DistArr,P2DistArr];
[P_DistAxis,P_DistPdenf] = plpdf(P_DistArr); title('Histogram For Distance (Unhealthy)')

%% For All Individuals
A_DistArr = [H_DistArr,P_DistArr];
[A_DistAxis,A_DistPdenf] = plpdf(A_DistArr); title('Histogram For Distance (All)') 

%% Visualization
figure;plot(H_DistAxis,H_DistPdenf,'LineWidth',3,'color','b'); hold on
plot(P_DistAxis,P_DistPdenf,'LineWidth',3,'color','r');
plot(A_DistAxis,A_DistPdenf,'LineWidth',3,'color',[222/255,125/255,0]);
xlabel('Distance Between Nodes','FontSize',16);
ylabel('Probability Density Function','FontSize',16);
title('PDF for Distance Between Nodes');
set(gca,'FontSize',16);
legend('Healthy','Unhealthy','All');
% % pdfDistance(distArrP);
