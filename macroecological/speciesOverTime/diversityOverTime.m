function [hMean,tMean,pMean,allMean] = diversityOverTime(hDataCell,tDataCell,pDataCell)

% Created by Li Jie.
% Date: 2018-4-23
% Calculate: Species Diversity VS. Time

%% hMean Calculation
% Step1. Size of healthy species diversity.
hMaxLength = 0;
for i = 1:size(hDataCell,2)
    hData = cell2mat(hDataCell(i));
    if length(hData(1,:)) > hMaxLength
        hMaxLength = length(hData(1,:));
    end
end
hSpeciesDiversity = zeros(size(hDataCell,2),hMaxLength);
% Step2. Healthy species diversity for each people.
for i = 1:size(hDataCell,2)
    hData = cell2mat(hDataCell(i));
    for j = 1:size(hData,2)
        hSpeciesDiversity(i,j) = length(nonzeros(hData(:,j)));
    end 
end
% Step3. Average for healthy species diversity.
% hMean = mean(hSpeciesDiversity,1); % It's wrong.
for i = 1:hMaxLength
    hMean(i) = round(sum(hSpeciesDiversity(:,i))/length(nonzeros(hSpeciesDiversity(:,i))));
end

%% tMean Calculation
% Step1. Size of healthy species diversity.
tMaxLength = 0;
for i = 1:size(tDataCell,2)
    tData = cell2mat(tDataCell(i));
    if length(tData(1,:)) > tMaxLength
        tMaxLength = length(tData(1,:));
    end
end
tSpeciesDiversity = zeros(size(tDataCell,2),tMaxLength);
% Step2. Healthy species diversity for each people.
for i = 1:size(tDataCell,2)
    tData = cell2mat(tDataCell(i));
    for j = 1:size(tData,2)
        tSpeciesDiversity(i,j) = length(nonzeros(tData(:,j)));
    end 
end
% Step3. Average for healthy species diversity.
% hMean = mean(hSpeciesDiversity,1); % It's wrong.
for i = 1:tMaxLength
    tMean(i) = round(sum(tSpeciesDiversity(:,i))/length(nonzeros(tSpeciesDiversity(:,i))));
end

%% pMean Calculation
% Step1. Size of patient species diversity.
pMaxLength = 0;
for ii = 1:size(pDataCell,2)
    pData = cell2mat(pDataCell(ii));
    if length(pData(1,:)) > pMaxLength
        pMaxLength = length(pData(1,:));
    end
end
pSpeciesDiversity = zeros(size(pDataCell,2),pMaxLength);
% Step2. Patient species diversity for each people.
for ii = 1:size(pDataCell,2)
    pData = cell2mat(pDataCell(ii));
    for jj = 1:size(pData,2)
        pSpeciesDiversity(ii,jj) = length(nonzeros(pData(:,jj)));
    end
end
% Step3. Average for patient species diversity.
% pMean = mean(pSpeciesDiversity,1); % It's wrong.
for i = 1:pMaxLength
    pMean(i) = round(sum(pSpeciesDiversity(:,i))/length(nonzeros(pSpeciesDiversity(:,i))));
end

%% Species diversity for all objects.
% Step1. Species diversity for all person
if length(hMean) > length(pMean)
    hpMean = [hMean;[pMean,zeros(1,length(hMean)-length(pMean))]];
else
    hpMean = [pMean;[hMean,zeros(1,length(pMean)-length(hMean))]];
end
% Step2. Average
for i = 1:size(hpMean,2)
    allMean(i) = round(sum(hpMean(:,i))/length(nonzeros(hpMean(:,i))));
end

% if hMaxLength > pMaxLength
%     allSpeciesDiversity = [hSpeciesDiversity;[pSpeciesDiversity,zeros(size(pSpeciesDiversity,1),hMaxLength - pMaxLength)]];
% elseif hMaxLength < pMaxLength
%     allSpeciesDiversity = [pSpeciesDiversity;[hSpeciesDiversity,zeros(size(hSpeciesDiversity,1),pMaxLength - hMaxLength)]];
% elseif hMaxLength == pMaxLength
%     allSpeciesDiversity = [hSpeciesDiversity;pSpeciesDiversity];
% end
% % Step2. Average
% for i = 1:size(allSpeciesDiversity,2)
%     allMean(i) = sum(allSpeciesDiversity(:,i))/length(nonzeros(allSpeciesDiversity(:,i)));
% end

%% Plot all curves in a figure.
plot(hMean,'color','blue','LineWidth',3);hold on; 
plot(tMean,'color',[0,185/255,0],'LineWidth',3);
plot(pMean,'color','red','LineWidth',3);hold off

legend('Health','Transitory','Unhealthy');
xlabel('Days');ylabel('Average Species Diversity');

% title('IBS Species Diversity Over Time')
set(gca,'FontSize',28);
