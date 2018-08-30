function preIndex = rankPlot(x,color)
% Created by Li Jie. Date: 2018-4-16
% rankPlot: Plot the rank abundance: (1) In linear scale
%                                    (2) In semi log-y scale
%                                    (3) Relative abundance ranking
%
% Input Arguments.
%   x: Data sets of a person.
% Output Arguments.
%   preIndex: Ranking order in OTU number.
%

meanAbundance = mean(x,2);
[sortMeanAbundance,preIndex] = sort(meanAbundance,'descend');
%% Abundance ranking in linear scale.
% 16S Science plot it with stairs() function.
% figure; plot(1:length(meanAbundance),sortMeanAbundance,'LineWidth',3,'color','r');
% xlabel('Species Rank');ylabel('Average Abundance'); title('Healthy Group');
% set(gca,'FontSize',28) %,'XTickLabel',{'one','two','three','four','five'});
%% Abundance ranking in semi-log-y scale.
semilogy(1:length(meanAbundance),sortMeanAbundance,'LineWidth',3,'color',color);%[0 0.8 0]
xlabel('Species Rank');ylabel('Average Abundance');% title('Unhealthy Group');
set(gca,'FontSize',28)
%% Relative abundance ranking.
% relativeAbundace = meanAbundance/sum(meanAbundance)*100;
% rank = sort(relativeAbundace,'descend');
% stairs(1:length(relativeAbundace),rank,'LineWidth',2,'color','r');
