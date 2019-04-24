function [xx2,pdenf] = plpdf_Parameter(data,p,xmin,xmax,groupName)

figure;
H = histfit(data,100,'kernel');
xx1 = H(1).XData;yy1 = H(1).YData;yy_sum  = sum(H(1).YData);

cd D:\project\Matlab\kde
P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html
% yy1 = H(1).YData/sum(H(1).YData);
xx2 = P.XData; yy2 = P.YData;
% yy2 = P.YData/sum(P.YData);

pdenf = P.YData/sum(P.YData);

%% bar and curve, hold on.
[ax,h1,h2] = plotyy(xx2,pdenf,xx1,yy1,@plot,@bar);
set(ax(1),'xlim',[xmin xmax],'FontSize',28,'Ycolor','black');
set(ax(2),'xlim',[xmin xmax],'FontSize',28,'Ytick',[]);
hh1 = get(ax(1),'ylabel');
set(hh1,'String','pdf','color','black');
xlabel(['Degree of Undirected Network (',groupName,')'],'FontSize',28);
set(h1,'color','r','LineWidth',3);set(h2,'facecolor','b');
% scrsz = get(0,'ScreenSize'); 
% set(gcf,'Position',scrsz);
% ylim([0 0.01])
% bar(xx1,yy1);
% hold on, plot(xx2,yy_sum .* pdenf,'linewidth',3,'color','r');
% xlim([xmin xmax]);

cd D:\project\Matlab\MIDERv2\results

