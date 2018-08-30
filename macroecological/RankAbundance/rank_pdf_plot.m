clear all
dataFile = 'Healthy_Group_IBS_withoutC_C1'; load(dataFile);
hGroupData = x';hRankIndex = rankPlot(hGroupData,'b'); hold on

dataFile = 'Transitory_Group_IBS'; load(dataFile);
tGroupData = x';tRankIndex = rankPlot(tGroupData,[0 0.8 0]);

dataFile = 'UnHealthy_Group_IBS_withoutC_C1'; load(dataFile);
pGroupData = x';pRankIndex = rankPlot(pGroupData,'r');
legend('Healthy','Transitory','Unhealthy');hold off

h = [0.001 0.0001 0.00004];
t = [0.0008 0.00005 0.000008];
p = [0.001 0.0001 0.00001];
pdf4TopMedLst(hGroupData,hRankIndex,h);% ,'Healthy'
pdf4TopMedLst(tGroupData,tRankIndex,t);% ,'Transitory'
pdf4TopMedLst(pGroupData,pRankIndex,p);% ,'Unhealthy'
hold off