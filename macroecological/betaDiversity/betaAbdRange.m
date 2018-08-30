function [minValue,maxValue] = betaAbdRange(dataCellCell)

hDataCellPeople_1 = dataCellCell{1};
hDataPeople_1 = cell2mat(hDataCellPeople_1(2:end,2:end));
minValue = min(min(hDataPeople_1));
maxValue = max(max(hDataPeople_1));

for i = 1:size(dataCellCell,2)
    dataCellPeople = dataCellCell{i};
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));
    if min(min(dataPeople)) < minValue
        minValue = min(min(dataPeople));
    end
    if max(max(dataPeople)) > maxValue
        maxValue = max(max(dataPeople));
    end
end

