function [betaOverEventsMean,eventsMean] = betaOverEvents(dataCellCell)

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
        
betaDiversityEvents_People = zeros(size(dataCellCell,2),maxTimeLength);
% betaDiversityEvents_People(:,1) = 0;   %% HOW to give value to the first Beta ???
events_People = zeros(size(dataCellCell,2),maxTimeLength);

for j = 1:size(dataCellCell,2)
    dataCellPeople = dataCellCell{j};
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));
    
    dataIndex_yesterday = find(dataPeople(:,1) ~= 0);
    speciesIndex_yesterday = dataIndex_yesterday + 1;
    speciesIndex_pre = speciesIndex_yesterday;
    events_People(j,1) = length(speciesIndex_yesterday);
    
    for jj = 2:size(dataPeople,2)
        speciesIndex_today = find(dataPeople(:,jj) ~= 0) + 1;
        
        events_People(j,jj) = length(speciesIndex_pre) + length(speciesIndex_today);
        
        % Compare speciesIndex_today with speciesIndex_pre.
        isMember = ismember(speciesIndex_today,speciesIndex_pre);
        commonCount_today = length(find(isMember == 1));
        speciesCount = length(speciesIndex_pre) + length(find(isMember == 0));
        betaDiversityEvents_People(j,jj) = commonCount_today/speciesCount;
        
        % Note: Here it can not be operated with the function of unique().
        % speciesIndex_pre = [speciesIndex_pre;speciesIndex_today]; clear speciesIndex_today
        speciesIndex_pre = speciesIndex_today; clear speciesIndex_today
    end
end

for ii = 1:maxTimeLength
    betaOverEventsMean(ii) = sum(betaDiversityEvents_People(:,ii))/length(nonzeros(betaDiversityEvents_People(:,ii)));
    eventsMean(ii) = sum(events_People(:,ii))/length(nonzeros(events_People(:,ii)));
end

%% Cut with size of short Time Length if needed.     
betaOverEventsMean = betaOverEventsMean(2:end);
eventsMean = eventsMean(2:end);
