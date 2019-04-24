function pdfDistance(distArr)

[distAxis,distPdenf] = plpdf(distArr); title('Histogram For Distance (Unhealthy)')

figure;plot(distAxis,distPdenf,'LineWidth',3,'color','b');
xlabel('Distance Between Nodes','FontSize',16);
ylabel('Probability Density Function','FontSize',16);
title('PDF for Distance Between Nodes (Unhealthy)');
set(gca,'FontSize',16);