clear all

[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

[hBetaOverPeopleMean,hBetaOverDaysMean] = betaOverPeople(hDataCellCell);
[tBetaOverPeopleMean,tBetaOverDaysMean] = betaOverPeople(tDataCellCell);
[pBetaOverPeopleMean,pBetaOverDaysMean] = betaOverPeople(pDataCellCell);
allBetaOverPeopleMean = [hBetaOverPeopleMean;pBetaOverPeopleMean];
% meanDaysBetaOverNumber = meanBetaOverNumberFunc(allBetaOverPeopleMean);
% All Values are identical if you make the calculation like this.

if length(hBetaOverDaysMean) > length(pBetaOverDaysMean)
    allBetaOverDaysMean = [mean([hBetaOverDaysMean(1:length(pBetaOverDaysMean));pBetaOverDaysMean],1),hBetaOverDaysMean(length(pBetaOverDaysMean)+1:end)];
elseif length(hBetaOverDaysMean) < length(pBetaOverDaysMean)
    allBetaOverDaysMean = [mean([pBetaOverDaysMean(1:length(hBetaOverDaysMean));hBetaOverDaysMean],1),pBetaOverDaysMean(length(hBetaOverDaysMean)+1:end)];
elseif length(hBetaOverDaysMean) == length(pBetaOverDaysMean)
    allBetaOverDaysMean = mean([hBetaOverDaysMean;pBetaOverDaysMean],1);
end

x_Axis = linspace(1,length(allBetaOverDaysMean),length(allBetaOverDaysMean));
figure;
p_H = plDiversityFit(x_Axis,hBetaOverDaysMean,'o','b');
p_T = plDiversityFit(x_Axis,tBetaOverDaysMean,'*',[0,185/255,0]);
p_P = plDiversityFit(x_Axis,pBetaOverDaysMean,'+','r');

ylim([0.1 1])
xlabel('Days (Log)');ylabel('\beta Diversity (Log)')
% title('IBS \beta-Diversity Over Days (Log-log)','FontSize',20);
legend('Healthy',['Fit_H (\gamma = ',num2str(p_H(1)),')'],'Transitory',['Fit_A (\gamma = ',num2str(p_T(1)),')'],'Unhealthy',['Fit_U (\gamma = ',num2str(p_P(1)),')']);
set(gca,'FontSize',20)
%% Figure
% peopleLabel={'Healthy A','Healthy B','Healthy C','Healthy C1','Unhealthy D','Unhealthy E'};
% figProperty(allBetaOverPeopleMean,peopleLabel)
