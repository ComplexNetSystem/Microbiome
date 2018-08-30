clear all
load groupNodesTE
%% Need to Color the plots manually
figure;eX = eprob(hTE); 
[alpha, xmin, L] = plfit(hTE);hold on
H_H = plplotModify(hTE,xmin, alpha);hold on
eX = eprob(tTE); 
[alpha, xmin, L] = plfit(tTE);hold on
H_T = plplotModify(tTE,xmin, alpha);hold on 
eX = eprob(uTE); 
[alpha, xmin, L] = plfit(uTE);hold on
H_U = plplotModify(uTE,xmin, alpha);hold on
xlim([10 1000]);xlabel('Structural Degree');ylabel('EPDF');% title(['EPDF of Distance (Healthy MaxEnt)','(\alpha = ',num2str(alpha),')']);
set(gca,'FontSize',28);
hold off