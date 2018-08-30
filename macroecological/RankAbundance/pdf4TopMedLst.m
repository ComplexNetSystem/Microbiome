function pdf4TopMedLst(groupData,rankIndex,para)

count = 10;
speciesNum = length(rankIndex);
topData = mean(groupData(rankIndex(1:count),:),1);
medData = mean(groupData(rankIndex(ceil(speciesNum/2)-count/2:ceil(speciesNum/2)+count/2-1),:),1);
lstData = mean(groupData(rankIndex(end-count+1:end),:),1);

figure;
[top_x,top_pdf] = plpdf_Parameter1(topData,para(1));hold on
[med_x,med_pdf] = plpdf_Parameter1(medData,para(2));
[lst_x,lst_pdf] = plpdf_Parameter1(lstData,para(3));
hold off

% figure;
% plot(top_x,top_pdf,'LineWidth',3,'color','b');hold on
% plot(med_x,med_pdf,'LineWidth',3,'color',[0 0.8 0]);
% plot(lst_x,lst_pdf,'LineWidth',3,'color','r');
% ylim([0 0.1]);ylim([0 0.02]);legend('TOP10','MIDDLE10','LEAST10');
% xlabel(['Average Abundance (',groupName,')']);ylabel('pdf');set(gca,'FontSize',28);

