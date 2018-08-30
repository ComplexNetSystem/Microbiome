function [groupData,groupText] = dataCombine(dataCell_norm,textCellCell)

n = length(textCellCell);

groupText = textCellCell{1};
groupDataWithTimes = [ones(size(dataCell_norm{1},1),1),dataCell_norm{1}];

for i = 2:n
    dataWithTimes = [ones(size(dataCell_norm{i},1),1),dataCell_norm{i}];
    isMember = ismember(textCellCell{i},groupText);
    for j = 1:length(isMember)
        if isMember(j) == 1
            indexInGroup = findIndexInGroup(textCellCell{i}(j),groupText);
            groupDataWithTimes(indexInGroup,:) = groupDataWithTimes(indexInGroup,:) + dataWithTimes(j,:); 
        else    %%  isMember(j) == 0
            groupDataWithTimes = [groupDataWithTimes;dataWithTimes(j,:)];
            groupText = [groupText;textCellCell{i}(j)];
        end
    end
end

groupData = groupDataWithTimes(:,2:end) ./ groupDataWithTimes(:,1);


function index = findIndexInGroup(string,groupTextInput)
m = length(groupTextInput);
for k = 1:m
    isWant = strcmp(string,groupTextInput(k));
    if isWant == 1
        index = k;
        break;
    else
        continue;
    end
end

