function [xx2,pdenf] = plpdf(data)

figure;
H = histfit(data,120,'kernel');
xx1 = H(1).XData;yy1 = H(1).YData;

cd D:\project\Matlab\kde
P = plot(kde(data,'rot')); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html
% yy1 = H(1).YData/sum(H(1).YData);
xx2 = P.XData; yy2 = P.YData;
% yy2 = P.YData/sum(P.YData);

pdenf = P.YData/sum(P.YData);

%% bar and curve, hold on.
bar(xx1,yy1);
hold on, plot(xx2,yy2,'linewidth',3,'color','r');

cd D:\project\Matlab\Microbiome\betaDiversity\pdfBeta

xlabel('\beta Diversity','FontSize',16);
ylabel('Frequency','FontSize',16);

set(gca,'FontSize',16);

