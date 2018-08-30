clear all
[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

hDiverseMean = gammaCal(hDataCellCell);
tDiverseMean = gammaCal(tDataCellCell);
pDiverseMean = gammaCal(pDataCellCell);

[hGammaAxis,hGammaPdenf] = plpdf_Parameter1(hDiverseMean,3,'b','o');hold on
[tGammaAxis,tGammaPdenf] = plpdf_Parameter1(tDiverseMean,8,[0 185/255 0],'o');hold on
[pGammaAxis,pGammaPdenf] = plpdf_Parameter1(pDiverseMean,8,'r','o');hold off

[hAlpha,hEvent] = alphaEventCal(hDataCellCell);
[tAlpha,tEvent] = alphaEventCal(tDataCellCell);
[pAlpha,pEvent] = alphaEventCal(pDataCellCell);

%-----Linear Scale------%
% plot(hEvent,hAlpha,'LineWidth',3,'color','b');hold on
% plot(tEvent,tAlpha,'LineWidth',3,'color',[0 185/255 0])
% plot(pEvent,pAlpha,'LineWidth',3,'color','r');hold off
% legend('Healthy','Transitory','Unhealthy'); axis tight

%-----Log-Log Scale------%
p_H = plDiversityFit(hEvent,hDiverseMean,'o','b');
p_T = plDiversityFit(tEvent,tDiverseMean,'*',[0,185/255,0]);
p_P = plDiversityFit(pEvent,pDiverseMean,'+','r');

xlabel('Events');ylabel('\gamma Diversity');set(gca,'FontSize',28);

legend('Healthy',['Fit (s_H = ',num2str(p_H(1)),')'],'Transitory',['Fit (s_T = ',num2str(p_T(1)),')'],'Unhealthy',['Fit (s_U = ',num2str(p_P(1)),')']);