clear all

% Created by Li Jie.
% Date: 2018-4-27.
% Calculate: 1. Common Species Diversity VS. Time(days).
%            2. Average Species Diversity VS. Time(days).
%            3. Total Number of Events VS. Time(days).
%            4. Average Species Diversity VS. Total Number of Events.
% Copyright: Matteo, Li Jie, Hokkaido University.

[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');
% [hValue_A,hText_A,hRaw_A] = xlsread('D:\project\Matlab\Microbiome\data4Person\IBS\Healthy_A_IBS.xlsx');
% [diverse,events,common] = speciesDiverse(hRaw_A);

hDiverseMean = gammaCal(hDataCellCell);
tDiverseMean = gammaCal(tDataCellCell);
pDiverseMean = gammaCal(pDataCellCell);

% [hDiverseMean,hEventsMean,hCommonMean] = speciesDiverseAverage(hDataCellCell);
% [tDiverseMean,tEventsMean,tCommonMean] = speciesDiverseAverage(tDataCellCell);
% [pDiverseMean,pEventsMean,pCommonMean] = speciesDiverseAverage(pDataCellCell);

% All Subjects, Great different among sample subjects each other.
% [hDiverseMeanCut,pDiverseMeanCut] = shortCut(hDiverseMean,pDiverseMean);
% [hEventsMeanCut,pEventsMeanCut] = shortCut(hEventsMean,pEventsMean);
% [hCommonMeanCut,pCommonMeanCut] = shortCut(hCommonMean,pCommonMean);
% allDiverseMean = mean([hDiverseMeanCut;pDiverseMeanCut],1);
% allEventsMean = mean([hEventsMeanCut;pEventsMeanCut],1);
% allCommonMean = mean([hCommonMeanCut;pCommonMeanCut],1);

%% All Figures Set.
% figure;plot(hCommonMean,'LineWidth',3,'color','b');hold on;
% plot(tCommonMean,'LineWidth',3,'color',[0,185/255,0]);
% plot(pCommonMean,'LineWidth',3,'color','r');
% xlabel('Time (Days)'); ylabel('Common Species Diversity');
% % title('IBS-Common Species Diversity Over Time');
% set(gca,'FontSize',28)
% legend('Healthy','Transitory','Unhealthy')

figure;plot(hDiverseMean,'LineWidth',3,'color','b');hold on;
plot(tDiverseMean,'LineWidth',3,'color',[0,185/255,0]);
plot(pDiverseMean,'LineWidth',3,'color','r');
xlabel('Days'); ylabel('\gamma Diversity');
% title('IBS Average Species Diversity Over Time');
set(gca,'FontSize',28)
legend('Healthy','Transitory','Unhealthy')

%%%%----PDF Estimate----%%%%
figure;
[hGammaAxis,hPdenf] = plpdf_Parameter1(hDiverseMean,3,'b','o'); hold on % title('Histogram For \alpha Diversity Over Days (Healthy)')
[tGammaAxis,tPdenf] = plpdf_Parameter1(tDiverseMean,8,[0,185/255,0],'o'); % title('Histogram For \alpha Diversity Over Days (Transitory)')
[pGammaAxis,pPdenf] = plpdf_Parameter1(pDiverseMean,8,'r','o'); hold off
legend('Healthy','pdf(\gamma_H)','Transitory','pdf(\gamma_T)','Unhealthy','pdf(\gamma_U)');

% figure;plot(hEventsMean,'LineWidth',3,'color','b');hold on;
% plot(tEventsMean,'LineWidth',3,'color',[0,185/255,0]);
% plot(pEventsMean,'LineWidth',3,'color','r');
% xlabel('Time (Days)'); ylabel('Total Events');
% % title('IBS-Total Number Of Events Over Time');
% set(gca,'FontSize',28)
% legend('Healthy','Transitory','Unhealthy')

p_H = polyfit(log(hEventsMean),log(hDiverseMean),1);
hDiverse_fit = exp(polyval(p_H,log(hEventsMean)));
figure;loglog(hEventsMean,hDiverseMean,'o',hEventsMean,hDiverse_fit,'-','LineWidth',3,'color','b','MarkerSize',13);hold on
p_T = polyfit(log(tEventsMean),log(tDiverseMean),1);
tDiverse_fit = exp(polyval(p_T,log(tEventsMean)));
loglog(tEventsMean,tDiverseMean,'*',tEventsMean,tDiverse_fit,'-','LineWidth',3,'color',[0,185/255,0],'MarkerSize',13);
p_P = polyfit(log(pEventsMean),log(pDiverseMean),1);
pDiverse_fit = exp(polyval(p_P,log(pEventsMean)));
loglog(pEventsMean,pDiverseMean,'+',pEventsMean,pDiverse_fit,'-','LineWidth',3,'color','r','MarkerSize',13);


xlabel('Total Events'); ylabel('\gamma Diversity');set(gca,'FontSize',20)
% title('Ave. Species Diversity Over Events (Log-log)');
legend('Healthy',['Fit (s_H = ',num2str(p_H(1)),')'],'Transitory',['Fit (s_T = ',num2str(p_T(1)),')'],'Unhealthy',['Fit (s_U = ',num2str(p_P(1)),')']);
