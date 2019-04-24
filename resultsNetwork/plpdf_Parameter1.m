function [xx2,pdenf] = plpdf_Parameter1(data,p,color,shape,xLim)

% figure;


cd D:\project\Matlab\kde
figure; P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html

xx2 = P.XData; yy2 = P.YData;
pdenf = P.YData/sum(P.YData);
cd D:\project\Matlab\MIDERv2\results
close;



[bincenters,bincounts] = histfitModify(data,100,'kernel');
bincounts = 0.01 * bincounts / sum(bincounts);

indexOfZeros = find(bincounts == 0);
bincounts(indexOfZeros) = [];bincenters(indexOfZeros) = [];

% scatter(bincenters,bincounts,80,color,shape,'filled');hold on
scatter(bincenters,bincounts,80,color,shape,'filled');hold on
% bar(bincenters,bincounts,1,'FaceColor','b');hold on
plot(xx2,pdenf,'Color',color,'LineWidth',3); 

xlabel('Shortest Distance (High Threshold)');ylabel('pdf');
% Abundance: x,y --> [0 0.03]
xlim(xLim);
ylim([0 0.04]);
% xlim([-1.5 2]);
% ylim([0 0.01]);
set(gca,'FontSize',28);
hold off

% xx1 = H(1).XData;yy1 = H(1).YData;yy_sum  = sum(H(1).YData);




