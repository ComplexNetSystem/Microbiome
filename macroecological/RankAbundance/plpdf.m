function pdenf = plpdf(data)

H = histfit(data,100,'kernel');

xx1 = H(1).XData;
% xx2 = H(2).XData;
yy1 = H(1).YData/sum(H(1).YData);
yy2 = H(2).YData/sum(H(2).YData);
pdenf = yy2;
% figure,plot(xx2,yy2,'linewidth',2);

%% bar and curve, hold on.
bar(xx1,yy1);
hold on, plot(xx1,pdenf,'linewidth',2,'color','r');

xlabel('Abundance','FontSize',16);
ylabel('pdf','FontSize',16);
set(gca,'FontSize',16);

