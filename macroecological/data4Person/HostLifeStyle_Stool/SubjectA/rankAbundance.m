clear all

hostAdata = xlsread('/home/lijie/MATLAB/Microbiome/data4Person/HostLifeStyle_Stool/SubjectA/A_HostLifeStyle_Stool.xlsx');

meanAbundance = mean(hostAdata,2);
relativeAbundace = meanAbundance/sum(meanAbundance)*100;
rank = sort(relativeAbundace,'descend');
stairs(1:length(relativeAbundace),rank,'LineWidth',2,'color','r');
