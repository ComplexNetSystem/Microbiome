function alphaValueDays = alphaOverDays(dataCell)

timeLenArr = zeros(1,size(dataCell,2));
maxTimeLength = size(dataCell{1},2);
minTimeLength = maxTimeLength;
for i = 1:size(dataCell,2)
    data = cell2mat(dataCell(i));
    timeLenArr(i) = size(data,2);
    if size(data,2) > maxTimeLength
        maxTimeLength = size(data,2);
    end
    if size(data,2) < minTimeLength
        minTimeLength = size(data,2);
    end
end

alphaDiversityDays_People = zeros(size(dataCell,2),maxTimeLength);

for i = 1:size(dataCell,2)
    data = cell2mat(dataCell(i));
    for j = 1:size(data,2)
        alphaDiversityDays_People(i,j) = length(find(data(:,j) ~= 0));
    end    
end

% alphaValueDays = alphaDiversityDays_People(1,1:size(dataCell{1},2));
% for ii = 2:size(dataCell,2)
%     alphaValueDays = [alphaValueDays,alphaDiversityDays_People(ii,1:size(dataCell{ii},2))];
% end
% Mean for alpha Diversity.
alphaValueDays = meanWithZeros(alphaDiversityDays_People,timeLenArr);

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
        meanData = ceil(mean(tempMat,1));
    else
        index = find(indexNum >= indexNumSort(i));
        tempMat = zeros(length(index),indexNumSort(i)-indexNumSort(i-1));
        for j = 1:length(index)
            tempMat(j,:) = data(index(j),indexNumSort(i-1) + 1:indexNumSort(i));
        end
        meanData = [meanData,ceil(mean(tempMat,1))];
    end
end

