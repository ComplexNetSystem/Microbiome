clear all
numberOfBin = 100; % Set.
%% Read all .xlsx files in specified path.
[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

[h_minAbd,h_maxAbd] = betaAbdRange(hDataCellCell);
[t_minAbd,t_maxAbd] = betaAbdRange(tDataCellCell);
[p_minAbd,p_maxAbd] = betaAbdRange(pDataCellCell);

minAbd = min([h_minAbd,t_minAbd,p_minAbd]);
maxAbd = max([h_maxAbd,t_maxAbd,p_maxAbd]);
abdAxis = linspace(minAbd,maxAbd,numberOfBin+1); 

%% Beta-Diversity Calculation
hBetaDiversityMean = betaCalculation(hDataCellCell,abdAxis); %% It is Better in speed: WITHOUT specific species names, just use INDEX for calculaton.
tBetaDiversityMean = betaCalculation(tDataCellCell,abdAxis);
pBetaDiversityMean = betaCalculation(pDataCellCell,abdAxis);

% For All Subjects.
% allBetaDiversityMean = mean([hBetaDiversityMean;pBetaDiversityMean],1);

%% Fit and Figures
p_H = plDiversityFit(abdAxis,hBetaDiversityMean,'o','b');
p_T = plDiversityFit(abdAxis,tBetaDiversityMean,'*',[0,185/255,0]);
p_P = plDiversityFit(abdAxis,pBetaDiversityMean,'+','r');

% ylim([0.1 1]);
xlabel('Species Abundance');ylabel('\beta Diversity')
% title('IBS \beta-Diversity Over Species Abundance (Log-log)','FontSize',16);
legend('Healthy',['Fit (s_H = ',num2str(p_H(1)),')'],'Transitory',['Fit (s_T = ',num2str(p_T(1)),')'],'Unhealthy',['Fit (s_U = ',num2str(p_P(1)),')']);
set(gca,'FontSize',28)

