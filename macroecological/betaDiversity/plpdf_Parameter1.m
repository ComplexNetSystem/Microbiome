function [xx2,pdenf] = plpdf_Parameter1(data,p,color,shape)

% figure;

cd D:\project\Matlab\kde
figure; P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html

xx2 = P.XData; yy2 = P.YData;
pdenf = P.YData/sum(P.YData);
cd D:\project\Matlab\Microbiome\betaDiversity
close;



[bincenters,bincounts] = histfitModify(data,100,'kernel');
bincounts =  bincounts / sum(bincounts);
bincounts(find(bincounts == 0)) = -1;
scatter(bincenters,0.04*bincounts,80,color,shape,'filled');hold on


% bincounts(indexOfZeros) = [];bincenters(indexOfZeros) = [];

% scatter(bincenters,bincounts,80,color,shape,'filled');hold on

% bar(bincenters,bincounts,1,'FaceColor','b');hold on
plot(xx2,pdenf,'Color',color,'LineWidth',3); 

xlabel('1-\beta');ylabel('pdf');
% Abundance: x,y --> [0 0.03]
xlim([0 1]);
ylim([0 0.02]);
% xlim([-1.5 2]);
% ylim([0 0.02]);
set(gca,'FontSize',28);
hold off

% xx1 = H(1).XData;yy1 = H(1).YData;yy_sum  = sum(H(1).YData);

