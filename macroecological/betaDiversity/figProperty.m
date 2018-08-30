function figProperty(data,LabelForPeople)
figure;
peopleNumber = linspace(1,length(data),length(data));
loglog(peopleNumber,data,'*','MarkerSize',8,'color','red');
xlabel('People(Log)');ylabel('<\beta>-Diversity(Log)');
set(gca,'FontSize',16);
title('IBS \beta-Diversity Over People (Log-log)')
% Add text to descript.
for kkk = 1:length(LabelForPeople)
        text(peopleNumber(kkk)+0.1,data(kkk)+0.1,LabelForPeople{kkk});
end