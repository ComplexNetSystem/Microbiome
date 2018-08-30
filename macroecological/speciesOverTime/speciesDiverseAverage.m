function [diverseMean,eventsMean,commonMean] = speciesDiverseAverage(DataCellCell)

longColumn = 0; shortColumn = size(DataCellCell{1},2);
for i = 1:length(DataCellCell)
    if size(DataCellCell{i},2) > longColumn
        longColumn = size(DataCellCell{i},2);
    end
    if size(DataCellCell{i},2) < shortColumn
        shortColumn = size(DataCellCell{i},2);
    end
end
longDay = longColumn-1; shortDay = shortColumn-1;%% The longest and shortest days.
diverseMat = zeros(length(DataCellCell),longDay);
eventsMat = zeros(length(DataCellCell),longDay);
commonMat = zeros(length(DataCellCell),longDay);

for ii = 1:length(DataCellCell)
    [diverse,events,common] = speciesDiverse(DataCellCell{ii});
    diverseMat(ii,1:length(diverse)) = diverse;
    eventsMat(ii,1:length(events)) = events;
    commonMat(ii,1:length(common)) = common;
end
% diverseMean = mean(diverseMat,1);
% eventsMean = mean(eventsMat,1);
for j = 1:longDay
    % hMean(j) = sum(hSpeciesDiversity(:,j))/length(nonzeros(hSpeciesDiversity(:,j)));
    diverseMean(j) = sum(diverseMat(:,j))/length(nonzeros(diverseMat(:,j)));
    eventsMean(j) = sum(eventsMat(:,j))/length(nonzeros(eventsMat(:,j)));
    commonMean(j) = sum(commonMat(:,j))/length(nonzeros(commonMat(:,j)));
end
diverseMean = ceil(diverseMean(1:shortDay));
eventsMean = ceil(eventsMean(1:shortDay));
commonMean = ceil(commonMean(1:shortDay));
