function [betaOverPeopleMean,betaOverDaysMean] = betaOverPeople(dataCellCell)

maxTimeLength = size(dataCellCell{1},2)-1;
minTimeLength = maxTimeLength;
for i = 1:size(dataCellCell,2)
    dataCell = dataCellCell{i};
    if size(dataCell,2)-1 > maxTimeLength
        maxTimeLength = size(dataCell,2)-1;
    end
    if size(dataCell,2)-1 < minTimeLength
        minTimeLength = size(dataCell,2)-1;
    end
end
        
betaDiversityDays_People = zeros(size(dataCellCell,2),maxTimeLength);

for j = 1:size(dataCellCell,2)
    dataCellPeople = dataCellCell{j};
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));  %% Discard the text in row 1 and column 1.
    
    dataIndex_yesterday = find(dataPeople(:,1) ~= 0);
    speciesIndex_yesterday = dataIndex_yesterday + 1;
    speciesIndex_pre = speciesIndex_yesterday;
    
    for jj = 2:size(dataPeople,2)
        speciesIndex_today = find(dataPeople(:,jj) ~= 0) + 1;
                
        % Compare speciesIndex_today with speciesIndex_pre.
        isMember = ismember(speciesIndex_today,speciesIndex_pre);
        commonCount_today = length(find(isMember == 1));
        speciesCount = length(speciesIndex_pre) + length(find(isMember == 0));
        betaDiversityDays_People(j,jj) = commonCount_today/speciesCount;
        
        % Note: Here it can not be operated with the function of unique().
        % speciesIndex_pre = [speciesIndex_pre;speciesIndex_today]; clear speciesIndex_today
        speciesIndex_pre = speciesIndex_today; clear speciesIndex_today
    end
end
betaOverPeopleMean = mean(betaDiversityDays_People(:,2:end),2);

%% Calculate the average over days.
% betaOverDaysMean = mean(betaDiversityDays_People(:,2:end),1);
for ii = 2:size(betaDiversityDays_People,2)
    betaOverDaysMean(ii-1) = sum(betaDiversityDays_People(:,ii))/length(betaDiversityDays_People(:,ii));
end


