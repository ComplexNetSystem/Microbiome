function dataCell_norm = normDataCell(dataCell,timeArr,timeLen)

n = length(dataCell);dataCell_norm = cell(1,n);
for i = 1:n
    dataCell_norm{i} = repmat(dataCell{i},1,timeLen/timeArr(i));
end
