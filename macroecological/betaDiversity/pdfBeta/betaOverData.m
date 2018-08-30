function betaValue = betaOverData(dataCellCell)

% Created by Li Jie
% Date: 2018-5-2
% Calculate: Beta over Events for all people and combine them as a vector.
% Copyright: Matteo, Li Jie, Hokkaido University.
timeLenArr = zeros(1,size(dataCellCell,2));
maxTimeLength = size(dataCellCell{1},2)-1;
minTimeLength = maxTimeLength;
for i = 1:size(dataCellCell,2)
    dataCell = dataCellCell{i};
    timeLenArr(i) = size(dataCell,2)-1;
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
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));
    
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

% betaValue = betaDiversityDays_People(1,2:size(dataCellCell{1},2)-1);
% for ii = 2:size(dataCellCell,2)
%     betaValue = [betaValue,betaDiversityDays_People(ii,2:size(dataCellCell{ii},2)-1)];
% end

betaValue = meanWithZeros(betaDiversityDays_People,timeLenArr);
betaValue = betaValue(2:end);

function meanData = meanWithZeros(data,indexNum)

% meanData = zeros(1,max(indexNum));
indexNumSort = sort(indexNum);
for i = 1:length(indexNumSort)
    if i == 1
        index = find(indexNum >= indexNumSort(i));
        tempMat = zeros(length(index),indexNumSort(i));
        for j = 1:length(index)
            tempMat(j,:) = data(index(j),1:indexNumSort(i));
        end
        meanData = mean(tempMat,1);
    else
        index = find(indexNum >= indexNumSort(i));
        tempMat = zeros(length(index),indexNumSort(i)-indexNumSort(i-1));
        for j = 1:length(index)
            tempMat(j,:) = data(index(j),indexNumSort(i-1) + 1:indexNumSort(i));
        end
        meanData = [meanData,mean(tempMat,1)];
    end
end
