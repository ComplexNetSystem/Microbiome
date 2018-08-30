function [xx2,pdenf] = plpdf_Parameter1(data,p)

% figure;


cd D:\project\Matlab\kde
figure; P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html

xx2 = P.XData; yy2 = P.YData;
pdenf = P.YData/sum(P.YData);
cd D:\project\Matlab\Microbiome\RankAbundance
close;



[bincenters,bincounts] = histfitModify(data,100,'kernel');
bincounts = bincounts / sum(bincounts);

bar(bincenters,bincounts,1,'FaceColor','b');hold on
plot(xx2,pdenf,'Color','red','LineWidth',3); 

xlabel('Species Abundance');ylabel('pdf');xlim([0 0.1]);ylim([0 0.1]);
set(gca,'FontSize',28);
% hold off

% xx1 = H(1).XData;yy1 = H(1).YData;yy_sum  = sum(H(1).YData);




