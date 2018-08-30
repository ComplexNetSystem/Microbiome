function [xx2,pdenf] = plpdfModify(data,p,xmin,xmax,groupName)

figure;
H = histfit(data(length(data)/2+1:end),100,'kernel');
xx1 = H(1).XData; yy1 = H(1).YData; yy_sum = sum(H(1).YData);

cd D:\project\Matlab\kde
P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html
% yy1 = H(1).YData/sum(H(1).YData);
xx2 = [0,P.XData(length(P.XData)/2+1:end)];
yy2 = 2 .* [sum(P.YData)/2-sum(P.YData(length(P.YData)/2+1:end)),P.YData(length(P.YData)/2+1:end)];
% yy2 = P.YData/sum(P.YData);

pdenf = yy2/sum(yy2);
% [xx2,pdenf] = toInter(xx2,pdenf);
% %% bar and curve, hold on.
% bar(xx1,yy1/yy_sum);hold on
% plot(xx2,pdenf,'LineWidth',3,'color','r');
% 
% xlim([xmin xmax]);ylim([0,1]);
% xlabel(['Average \alpha Diversity (',groupName,')']); ylabel('pdf'); 
% set(gca,'FontSize',28)



% function [x_int,pdf] = toInter(xData,pdfData)
% x_int = round(min(xData)):1:round(max(xData));
% pdf = zeros(1,length(x_int));
% for i = 1:length(x_int)
%     pdf(i) = sum(pdfData(find(xData >= (x_int(i)-0.5) & xData < (x_int(i)+0.5))));
% end

[ax,h1,h2] = plotyy(xx2,pdenf,xx1,yy1,@plot,@bar);
set(ax(1),'xlim',[xmin xmax],'FontSize',28,'Ycolor','black');
set(ax(2),'xlim',[xmin xmax],'FontSize',28,'Ytick',[]);
hh1 = get(ax(1),'ylabel');
set(hh1,'String','pdf','color','black');
xlabel(['Average \alpha Diversity over Abundance (',groupName,')'],'FontSize',28);
set(h1,'color','r','LineWidth',3);set(h2,'facecolor','b');

cd D:\project\Matlab\Microbiome\alphaDiversity

