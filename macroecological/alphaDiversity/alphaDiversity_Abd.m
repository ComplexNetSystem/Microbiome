clear all

% Created by Li Jie.
% Date: 2018-4-25; Update: 2018-4-29
% Calculate: Alpha over Abundance Bins.
% Copyright: Matteo, Li Jie, Hokkaido University.

numberOfBin = 100; % Set.
%% Read all .xlsx files in specified path.
[hDataCell,tDataCell,pDataCell] = rdxlsx2data('D:\project\Matlab\Microbiome\data4Person\IBS');

[h_minAbd,h_maxAbd] = alphaAbdRange(hDataCell);
[t_minAbd,t_maxAbd] = alphaAbdRange(tDataCell);
[p_minAbd,p_maxAbd] = alphaAbdRange(pDataCell);

minAbd = min([h_minAbd,t_minAbd,p_minAbd]);
maxAbd = max([h_maxAbd,t_maxAbd,p_maxAbd]);
% abdAxis = linspace(minAbd,maxAbd,numberOfBin);
abdAxis = linspace(minAbd,maxAbd,numberOfBin + 1);


h_diversityMean = alphaDiversityUpdate(hDataCell,abdAxis);
p_H = plDiversityFit(abdAxis,h_diversityMean,'o','b');
t_diversityMean = alphaDiversityUpdate(tDataCell,abdAxis);
p_T = plDiversityFit(abdAxis,t_diversityMean,'*',[0,185/255,0]);
p_diversityMean = alphaDiversityUpdate(pDataCell,abdAxis);
p_P = plDiversityFit(abdAxis,p_diversityMean,'+','r');



xlabel('Species Abundance');ylabel('Average Species Diversity');xlim([0 1])
% title('IBS \alpha-Diversity Over Species Abundance (Log-log)','FontSize',16);
legend('Healthy',['Fit_H (\gamma = ',num2str(p_H(1)),')'],'Transitory',['Fit_T (\gamma = ',num2str(p_T(1)),')'],'Unhealthy',['Fit_U (\gamma = ',num2str(p_P(1)),')']);
% legend('Healthy','Transitory','Unhealthy');
set(gca,'FontSize',20)

