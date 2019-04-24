function [xx2,pdenf] = plpdf_Parameter_noFig(data,p)

cd D:\project\Matlab\kde
P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html
% yy1 = H(1).YData/sum(H(1).YData);
xx2 = P.XData; yy2 = P.YData;
% yy2 = P.YData/sum(P.YData);

pdenf = P.YData/sum(P.YData);
cd D:\project\Matlab\MIDERv2
close all
%% bar and curve, hold on.
% bar(xx1,yy1);
% hold on, plot(xx2,yy_sum .* pdenf,'linewidth',3,'color','r');
% 
% cd D:\project\Matlab\MIDERv2\results
% 
% xlabel('Clustering Coefficient','FontSize',16);
% ylabel('Frequency','FontSize',16);
% 
% set(gca,'FontSize',16);

