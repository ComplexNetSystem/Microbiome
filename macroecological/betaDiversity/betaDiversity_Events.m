clear all

[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

[hBetaOverEventsMean,hEventsMean] = betaOverEvents(hDataCellCell);
[tBetaOverEventsMean,tEventsMean] = betaOverEvents(tDataCellCell);
[pBetaOverEventsMean,pEventsMean] = betaOverEvents(pDataCellCell);

plot(hBetaOverEventsMean,'LineWidth',3,'color','b');hold on
plot(tBetaOverEventsMean,'LineWidth',3,'color',[0,185/255,0]);
plot(pBetaOverEventsMean,'LineWidth',3,'color','r');hold off
legend('Healthy','Transitory','Unhealthy');
ylim([0 1]);xlabel('Days');ylabel('\beta Diversity');set(gca,'FontSize',28)

%%%%----PDF Estimate----%%%%
figure;
[hBetaAxis,hPdenf] = plpdf_Parameter1(hBetaOverEventsMean,0.04,'b','o'); hold on % title('Histogram For \alpha Diversity Over Days (Healthy)')
[tBetaAxis,tPdenf] = plpdf_Parameter1(tBetaOverEventsMean,0.04,[0,185/255,0],'o');hold on % title('Histogram For \alpha Diversity Over Days (Transitory)')
[pBetaAxis,pPdenf] = plpdf_Parameter1(pBetaOverEventsMean,0.04,'r','o'); hold off
legend('Healthy','pdf(1-\beta_H)','Transitory','pdf(1-\beta_T)','Unhealthy','pdf(1-\beta_U)');


%---------------Log-Log----------------%
p_H = polyfit(log(hEventsMean),log(hBetaOverEventsMean),1);
hBeta_fit = exp(polyval(p_H,log(hEventsMean)));
figure;loglog(hEventsMean,hBetaOverEventsMean,'o',hEventsMean,hBeta_fit,'-','LineWidth',3,'color','b','MarkerSize',13);hold on
p_T = polyfit(log(tEventsMean),log(tBetaOverEventsMean),1);
tBeta_fit = exp(polyval(p_T,log(tEventsMean)));
loglog(tEventsMean,tBetaOverEventsMean,'*',tEventsMean,tBeta_fit,'-','LineWidth',3,'color',[0,185/255,0],'MarkerSize',13);
p_P = polyfit(log(pEventsMean),log(pBetaOverEventsMean),1);
pBeta_fit = exp(polyval(p_P,log(pEventsMean)));
loglog(pEventsMean,pBetaOverEventsMean,'+',pEventsMean,pBeta_fit,'-','LineWidth',3,'color','r','MarkerSize',13);
%---------------Log-Log----------------%


% title('IBS \beta-Diversity Over Total Number Of Events (Log-log)');
legend('Healthy',['Fit (s_H = ',num2str(p_H(1)),')'],'Transitory',['Fit (s_T = ',num2str(p_T(1)),')'],'Unhealthy',['Fit (s_U = ',num2str(p_P(1)),')']);
xlabel('Events');ylabel('\beta Diversity');set(gca,'FontSize',28);

