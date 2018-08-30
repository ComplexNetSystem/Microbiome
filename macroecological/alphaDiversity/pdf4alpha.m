clear all

[hDataCell,tDataCell,pDataCell] = rdxlsx2data('D:\project\Matlab\Microbiome\data4Person\IBS');

hAlphaValueDays = alphaOverDays(hDataCell);%hAlphaValueDays_S = [hAlphaValueDays*(-1),hAlphaValueDays];
tAlphaValueDays = alphaOverDays(tDataCell);
pAlphaValueDays = alphaOverDays(pDataCell);%pAlphaValueDays_S = [pAlphaValueDays*(-1),pAlphaValueDays];
% allAlphaValueDays = [hAlphaValueDays,pAlphaValueDays];%allAlphaValueDays_S = [allAlphaValueDays*(-1),allAlphaValueDays];

figure;
[hAlphaAxis,hPdenf] = plpdf_Parameter1(hAlphaValueDays,2,'b','o'); hold on % title('Histogram For \alpha Diversity Over Days (Healthy)')
[tAlphaAxis,tPdenf] = plpdf_Parameter1(tAlphaValueDays,5,[0,185/255,0],'o');hold on % title('Histogram For \alpha Diversity Over Days (Transitory)')
[pAlphaAxis,pPdenf] = plpdf_Parameter1(pAlphaValueDays,5,'r','o'); hold off
legend('Healthy','pdf(\alpha_H)','Transitory','pdf(\alpha_T)','Unhealthy','pdf(\alpha_U)');
set(gca,'FontSize',28)
% [pAlphaAxis,pPdenf] = plpdf_Parameter(pAlphaValueDays,8,0,100,'Unhealthy'); hold off% title('Histogram For \alpha Diversity Over Days (Unhealthy)')
% plot(hAlphaAxis,hPdenf,'LineWidth',3); 
% plot(tAlphaAxis,tPdenf,'LineWidth',3); 
% plot(pAlphaAxis,1-pPdenf,'LineWidth',3);hold on
figure;area(hAlphaAxis,1-hPdenf,'FaceColor','b');xlim([0 80]);ylim([0.985 1]);xlabel('\alpha');ylabel('1-pdf(\alpha)');set(gca,'FontSize',28)
figure;area(tAlphaAxis,1-tPdenf,'FaceColor',[0 185/255 0]);xlim([0 80]);ylim([0.985 1]);xlabel('\alpha');ylabel('1-pdf(\alpha)');set(gca,'FontSize',28)
figure;area(pAlphaAxis,1-pPdenf,'FaceColor','r');xlim([0 80]);ylim([0.985 1]);xlabel('\alpha');ylabel('1-pdf(\alpha)');set(gca,'FontSize',28)


%%------EPDF for Alpha over Days-------%%%
%% need to set color for plots manually

% figure;eX = eprob(hAlphaValueDays'); 
% [alpha, xmin, L] = plfit(hAlphaValueDays');hold on
% H_H = plplotModify(hAlphaValueDays',xmin, alpha);hold on
% eX = eprob(tAlphaValueDays'); 
% [alpha, xmin, L] = plfit(tAlphaValueDays');hold on
% H_T = plplotModify(tAlphaValueDays',xmin, alpha);hold on 
% eX = eprob(pAlphaValueDays'); 
% [alpha, xmin, L] = plfit(pAlphaValueDays');hold on
% H_U = plplotModify(pAlphaValueDays',xmin, alpha);hold on
% xlim([10 100]);xlabel('\alpha Diversity');ylabel('EPDF');% title(['EPDF of Distance (Healthy MaxEnt)','(\alpha = ',num2str(alpha),')']);
% set(gca,'FontSize',28);
% hold off
