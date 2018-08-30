clear all

% Created by Li Jie. Date: 2018-4-20
% Calculation: 1. Species Diversity VS. Rank Abundance.
%              2. epdf and pdf for TOP, Intermediate,Least 10 Rank Abundance.
% Copyright: Matteo, Li Jie, Hokkaido Univeristy.

hostAdata = xlsread('D:\project\Matlab\Microbiome\data4Person\IBS\Healthy_A_IBS.xlsx');% For Windows OS.
% dataFile = 'UnHealthy_Group_IBS_withoutC_C1'; load(dataFile);  % "Healthy_Group_IBS_withoutC_C1"
                                                             % "Transitory_Group_IBS"
                                                             % "UnHealthy_Group_IBS_withoutC_C1"
% hostAdata = xlsread('/home/lijie/MATLAB/Microbiome/data4Person/HostLifeStyle_Stool/SubjectA/A_HostLifeStyle_Stool.xlsx');% For Linux OS.
% rankIndex = rankPlot(x','r');
rankIndex = rankPlot(hostAdata,'r');

%% Discard all-zero values OTU.
for j = length(rankIndex):-1:1
    if (all(hostAdata(rankIndex(j),:)==0)) == 1
        continue;
    else
        rankIndex = rankIndex(1:j);
        break;
    end
end
% Bug
for i = 1:2
    disp(['Running...',num2str(i),'...']);
    
    %% For top 10 abundance
    figure; subplot(1,2,1)
    pdenf = plpdf(hostAdata(rankIndex(i),:));
    title(['pdf-TOP',num2str(i),'-OTU',num2str(rankIndex(i))],'FontSize',16)
    subplot(1,2,2)
    [alpha, xmin, L] = plfit(hostAdata(rankIndex(i),:)');
    % plplotModify_linear(hostAdata(rankIndex(i),:)',xmin,alpha,i,rankIndex(i)); % Plotted in linear scale.
    plplotModify(hostAdata(rankIndex(i),:)',xmin,alpha);% Plotted in log-log scale.
    title(['epdf-TOP',num2str(i),'-OTU',num2str(rankIndex(i)),'(Log-log)','(\alpha = ',num2str(alpha),')'],'FontSize',16)
    % Maximize the active figure window following the screen size.
    scrsz = get(0,'ScreenSize'); 
    set(gcf,'Position',scrsz);
    % Save the figure to a word file.
    save2word('Most10abundance.docx');
    
    clear pdenf alpha xmin L
    
   %% For least 10 abundance
    figure; subplot(1,2,1)
    pdenf = plpdf(hostAdata(rankIndex(end-i+1),:));
    title(['pdf-Least',num2str(i),'-OTU',num2str(rankIndex(end-i+1))],'FontSize',16)
    subplot(1,2,2)
    [alpha, xmin, L] = plfit(hostAdata(rankIndex(end-i+1),:)');
    plplotModify(hostAdata(rankIndex(end-i+1),:)',xmin,alpha);
    title(['epdf-Least',num2str(i),'-OTU',num2str(rankIndex(end-i+1)),'(Log-log)','(\alpha = ',num2str(alpha),')'],'FontSize',16)
    % Maximize the active figure window following the screen size.
    scrsz = get(0,'ScreenSize'); 
    set(gcf,'Position',scrsz);
    % Save the figure to a word file.
    save2word('Least10abundance.docx');
    
    clear pdenf alpha xmin L
    
    %% For 10 intermediate abundance
    figure; subplot(1,2,1)
    pdenf = plpdf(hostAdata(rankIndex(floor(end/2)+i-1),:));
    title(['pdf-Intermediate',num2str(i),'-OTU',num2str(rankIndex(floor(end/2)+i-1))],'FontSize',16)
    subplot(1,2,2)
    [alpha, xmin, L] = plfit(hostAdata(rankIndex(floor(end/2)+i-1),:)');
    plplotModify(hostAdata(rankIndex(floor(end/2)+i-1),:)',xmin,alpha);
    title(['epdf-Intermediate',num2str(i),'-OTU',num2str(rankIndex(floor(end/2)+i-1)),'(Log-log)','(\alpha = ',num2str(alpha),')'],'FontSize',16)
    % Maximize the active figure window following the screen size.
    scrsz = get(0,'ScreenSize'); 
    set(gcf,'Position',scrsz);
    % Save the figure to a word file.
    save2word('Intermediate10abundance.docx');
    
    clear pdenf alpha xmin L
    
end

