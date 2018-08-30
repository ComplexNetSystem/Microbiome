function p = plDiversityFit(xAxis,diversityData,mark,color)

diversityData(diversityData==0) = [];
abdAxis = linspace(0,max(xAxis),length(diversityData)+1);
abdAxis = abdAxis(2:end);
p = polyfit(log(abdAxis),log(diversityData),1);
diversity_fit = exp(polyval(p,log(abdAxis)));% mark = 'o';
loglog(abdAxis,diversityData,mark,abdAxis,diversity_fit,'-','LineWidth',3,'color',color,'MarkerSize',13);hold on
% plot(abdAxis,diversityData,'LineWidth',3,'color',color);hold on
