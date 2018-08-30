function pdenf = plpdf(data)

figure; 
H = histfit(data,100,'kernel');

xx1 = H(1).XData;
% xx2 = H(2).XData;
yy1 = H(1).YData/sum(H(1).YData);
yy2 = H(2).YData/sum(H(2).YData);
pdenf = yy2;
% figure,plot(xx2,yy2,'linewidth',2);

%% bar and curve, hold on.
bar(xx1,yy1);axis([0,max(xx1),0,max(yy1)])
hold on, plot(xx1,pdenf,'linewidth',3,'color','r'); 
set(gca,'FontSize',16);
xlabel('Species Diversity','FontSize',16);
ylabel('pdf-diveristy','FontSize',16);
title('pdf-diveristy Curve','FontSize',16)

