% clear all

% Created by Li Jie
% Date: 2018-4-24
% Calculate: Diversity VS. Time.
% Healthy group.      File Name:  Healthy_xxx_xxx.xlsx
% Unhealthy group.    File Name:  Patient_xxx_xxx.xlsx
% If you want to change the prefix of file names, You ALSO need to CHANGE the rdxlsx2data.m
% Updated by Li Jie on 2018-4-28. Please go: Path: 'D:\project\Matlab\Microbiome\speciesDiversity'

%% Read all .xlsx files in specified path.
[hDataCell,tDataCell,pDataCell] = rdxlsx2data('D:\project\Matlab\Microbiome\data4Person\IBS');
% hostAdata = xlsread('D:\project\Matlab\Microbiome\data4Person\HostLifeStyle_Stool\SubjectA\A_HostLifeStyle_Stool.xlsx');% For Windows OS.
% hostAdata = xlsread('/home/lijie/MATLAB/Microbiome/data4Person/HostLifeStyle_Stool/SubjectA/A_HostLifeStyle_Stool.xlsx');% For Linux OS.
%% Data processing.
[hMean,tMean,pMean,allMean] = diversityOverTime(hDataCell,tDataCell,pDataCell);
combineAllMean = [pMean,tMean,hMean];
pTime = length(pMean);tTime = length(tMean);hTime = length(hMean);time = [1:length(combineAllMean)];
figure;scatter(time,combineAllMean,80,'black','o','filled');hold on
[t1,y1] = curveFit(time,combineAllMean,'ro');hold off
ylim([10 80]);xlabel('Time');ylabel('\alpha Diversity');set(gca,'FontSize',28)

figure;scatter([1:pTime],pMean,80,'r','o','filled');hold on
scatter([(pTime+1):(pTime+tTime)],tMean,80,[0 185/255 0],'o','filled');hold on
scatter([(pTime+tTime+1):length(combineAllMean)],hMean,80,'b','o','filled');hold on
[t2,y2] = curveFit(time,combineAllMean,'ko');
legend('Unhealthy','Transitory','Healthy','Fitting')
ylim([10 80]);xlabel('Time');ylabel('\alpha Diversity');set(gca,'FontSize',28)