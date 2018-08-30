function speciesDiversity = specDiver(data)

for j = 1:size(data,2)
    speciesDiversity(j) = length(nonzeros(data(:,j))); 
end

overallAbd = sum(data,1);

figure; 
plot(speciesDiversity,'LineWidth',2);axis([0,size(data,2),0,max(speciesDiversity)])
set(gca,'FontSize',16);
xlabel('Time (days)','FontSize',16);
ylabel('Species diversity (OTUs)','FontSize',16);
title('Diversity-Time Curve','FontSize',16)

figure; 
% semilogx(sort(overallAbd),speciesDiversity,'LineWidth',2); axis tight
% xlabel('Overall Abundance (Log)','FontSize',16);
loglog(sort(overallAbd),speciesDiversity,'bo','MarkerSize',8,'MarkerFaceColor',[1 1 1]);
% plot(sort(overallAbd),speciesDiversity,'bo','MarkerSize',8,'MarkerFaceColor',[1 1 1]);
xlabel('Overall Abundance','FontSize',16);
set(gca,'FontSize',16);
ylabel('Species diversity (OTUs)','FontSize',16);
title('Diversity-Abundance Curve (Log-log)','FontSize',16)
