clear all
%%%%-----ÒÑ·ÏÆú,ÓÃsigmaOverMu_2.m---------%%%%%
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
                                % 'output_Healthy_Group' or 'output_Healthy_Group_withoutC_C1'
                                % 'output_Unhealthy_Group' or 'output_Unhealthy_Group_withoutC_C1'
                                % 'output_Transitory_Group'
%% Acquire threshold for Maximum Transfer Entropy.
% [threMax,threArr,totalOfTE] = threMaxTeAquire(Output.T);

[sigmaArr,muArr,totalTEArrEachNode] = sigmaMuFunc(Output.H,Output.T);
% -----------------------
figure
scatter(muArr,sigmaArr,60,'r','filled');hold on %[0 185/255 0]
plot([0,1],[0,1],'LineWidth',3,'color','black');
xlabel('\mu');ylabel('\sigma');set(gca,'FontSize',28);title('\sigma-\mu (Healthy)')
hold off
% --------------------------
% figure;
[sortEntArr,indexEnt] = sort(totalTEArrEachNode,'descend'); figure;plot(sortEntArr,'color',[0 185/255 0],'LineWidth',3)
speciesNameEnt = variables(indexEnt(1:10));
figure;
bar(sortEntArr(1:10));xlabel('Rank (Transitory)');ylabel('Total Entropy');ylim([0 150])
set(gca,'XTickLabel',[],'FontSize',28);
xpoints = get(gca,'XTick');ypoints = sortEntArr(1:10);
% rotateticklabel(gca,80);
text(xpoints,ypoints,speciesNameEnt,'HorizontalAlignment','right','rotation',90,'FontSize',24)

timeSeriesTop10Ent = x(:,indexEnt(1:10)); aveAbdOverTime = mean(timeSeriesTop10Ent,2);
% plot(aveAbdOverTime,'color','b','LineWidth',3);hold on
% plot(aveAbdOverTime(1:15),'color',[0 185/255 0],'LineWidth',3);
% plot(aveAbdOverTime(1:14),'color','r','LineWidth',3);
[x_MeanSort,indexAbd] = sort(mean(x,1),'descend');
speciesNameAbd = variables(indexAbd(1:10));
timeSeriesTop10Abd = x(:,indexAbd(1:10));
figure;
bar(x_MeanSort(1:10));xlabel('Rank-Top10 (Transitory)');ylabel('Average Abundance');ylim([0 1])
set(gca,'XTickLabel',[],'FontSize',28);
xpoints = get(gca,'XTick');ypoints = x_MeanSort(1:10);
% rotateticklabel(gca,80);
text(xpoints,ypoints,speciesNameAbd,'HorizontalAlignment','left','rotation',90,'FontSize',24)
