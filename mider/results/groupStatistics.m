function groupStatistics(H_Data,UnhData,AllData,p)

[hAxis,hPdenf] = plpdf_Parameter(H_Data,p); title('Hist. For Clu-Coeff in MaxEnt Network (Healthy)')

[pAxis,pPdenf] = plpdf_Parameter(UnhData,p); title('Hist. For Clu-Coeff in MaxEnt Network (Unhealthy)')

[allAxis,allPdenf] = plpdf_Parameter(AllData,p); title('Hist. For Clu-Coeff in MaxEnt Network (All)')


figure;plot(hAxis,hPdenf,'LineWidth',3,'color','b'); hold on

plot(pAxis,pPdenf,'LineWidth',3,'color','r');

plot(allAxis,allPdenf,'LineWidth',3,'color',[222/255,125/255,0]);

xlabel('Clustering Coefficient');ylabel('pdf');title('PDFs of Clu-Coeff for Groups')
legend('Healthy','Unhealthy','All');set(gca,'FontSize',16);

hold off;