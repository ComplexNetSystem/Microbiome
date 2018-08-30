function [xx2,pdenf] = plpdfModify(data,p,color,shape)

cd D:\project\Matlab\kde
figure;P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html

xx2 = [0,P.XData(length(P.XData)/2+1:end)];
yy2 = 2 .* [sum(P.YData)/2-sum(P.YData(length(P.YData)/2+1:end)),P.YData(length(P.YData)/2+1:end)];
pdenf = yy2/sum(yy2);
cd D:\project\Matlab\resultsUpdate
close
[bincenters,bincounts] = histfitModify(data,100,'kernel');
bincounts =  bincounts / sum(bincounts);
bincounts(find(bincounts == 0)) = -1;
scatter(bincenters(length(bincenters)/2+1:end),0.1*bincounts(length(bincounts)/2+1:end),80,color,shape,'filled');hold on
xlabel('\alpha Over OTE');ylabel('pdf');
plot(xx2,pdenf,'Color',color,'LineWidth',3); 
% Abundance: x,y --> [0 0.03]
xlim([0 20]);
ylim([0 0.2]);
% xlim([-1.5 2]);
% ylim([0 0.01]);
set(gca,'FontSize',28);
hold off




