% clear all

%% 该段代码依赖两个程序运行数据，所以先运行：
%-------1. D:\project\Matlab\Microbiome\alphaDiversity\pdf4alpha.m--------%
% 去掉: clear all,再运行下面
%-------2. D:\project\Matlab\Microbiome\speciesOverTime\plDiversity.m------%
% hAlphaAxis
% tAlphaAxis
% pAlphaAxis
time = [59 29 0];
% hPdenf
% tPdenf
% pPdenf

figure;
for i=1:length(time)
    if i == 1
        hTime_axis = time(1)*ones(size(hAlphaAxis));
        plot3(hAlphaAxis,hTime_axis,1-hPdenf,'color','b','LineWidth',3);hold on
    elseif i == 2
        tTime_axis = time(2)*ones(size(tAlphaAxis));
        plot3(tAlphaAxis,tTime_axis,1-tPdenf,'color',[0 185/255 0],'LineWidth',3);hold on
    elseif i == 3
        pTime_axis = time(3)*ones(size(pAlphaAxis));
        plot3(pAlphaAxis,pTime_axis,1-pPdenf,'color','r','LineWidth',3);hold on
    end
end

plot3(y1,t1,0.98*ones(1,length(t1)),'color','black','LineWidth',3)

scatter3(pMean,[1:pTime],0.98*ones(1,length(pMean)),80,'r','o','filled');hold on
scatter3(tMean,[(pTime+1):(pTime+tTime)],0.98*ones(1,length(tMean)),80,[0 185/255 0],'o','filled');hold on
scatter3(hMean,[(pTime+tTime+1):length(combineAllMean)],0.98*ones(1,length(hMean)),80,'b','o','filled');hold on

% fill3([tAlphaAxis,tTime_axis,1-tPdenf],[tAlphaAxis,tTime_axis,0.985*ones(1,200)],[13.6*ones(1,100),29*ones(1,100),linspace(0.98,0.9955,100)],'r')
xlabel('\alpha');ylabel('Time');zlabel('1-pdf(\alpha)');set(gca,'FontSize',28)
grid on

all_1MinusPDF = [1-hPdenf,1-tPdenf,1-pPdenf];
allAlpha = [hAlphaAxis,tAlphaAxis,pAlphaAxis];
allTime = [hTime_axis,tTime_axis,pTime_axis];
cftool   % Input allAlpha;allTime;all_1MinusPDF
% createFit1(allAlpha, allTime, all_1MinusPDF);