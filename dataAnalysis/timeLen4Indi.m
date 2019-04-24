function timeLenArr = timeLen4Indi(dataCell)

n = length(dataCell);
timeLenArr = zeros(1,n);
for i = 1:n
    timeLenArr(i) = size(dataCell{i},2);
end
