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

%% bar and curve, hold on.
% bar(xx1,yy1/yy_sum);hold on
% plot(xx2,pdenf,'LineWidth',3,'color','r');
% 
% xlim([xmin xmax]);ylim([0,1]);
% xlabel(['\beta Diversity over Abundance (',groupName,')']); ylabel('pdf'); 
% set(gca,'FontSize',28)

[ax,h1,h2] = plotyy(xx2,pdenf,xx1,yy1,@plot,@bar);
set(ax(1),'xlim',[xmin xmax],'FontSize',28,'Ycolor','black');
set(ax(2),'xlim',[xmin xmax],'FontSize',28,'Ytick',[]);
hh1 = get(ax(1),'ylabel');
set(hh1,'String','pdf','color','black');
xlabel(['Average \alpha Diversity over Abundance (',groupName,')'],'FontSize',28);
set(h1,'color','r','LineWidth',3);set(h2,'facecolor','b');

cd D:\project\Matlab\Microbiome\betaDiversity\pdfBeta



% [ax,h1,h2] = plotyy(xx1,yy1,xx2,pdenf,@bar,@plot);
% set(ax(1),'xlim',[xmin xmax],'YColor','b','FontSize',28);
% set(ax(2),'xlim',[xmin xmax],'YColor','r','FontSize',28);
% hh1 = get(ax(1),'ylabel');set(hh1,'String','Frequency');
% hh2 = get(ax(2),'ylabel');set(hh2,'String','pdf')
% xlabel('\beta Diversity','FontSize',28);
% set(h1,'facecolor','b');
% set(h2,'color','r','LineWidth',3);
% scrsz = get(0,'ScreenSize'); 
% set(gcf,'Position',scrsz);

% bar(xx1,yy1);
% hold on, plot(xx2,yy_sum .* pdenf,'linewidth',3,'color','r');
% xlim([xmin xmax]);



