function [minValue,maxValue] = alphaAbdRange(dataCell)

minValue = min(min(cell2mat(dataCell(1))));
maxValue = max(max(cell2mat(dataCell(1))));
for i = 1:size(dataCell,2)
    data = cell2mat(dataCell(i));
    if min(min(data)) < minValue
        minValue = min(min(data));
    end
    if max(max(data)) > maxValue
        maxValue = max(max(data));
    end
end