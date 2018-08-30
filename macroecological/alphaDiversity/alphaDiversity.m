function diversityMean = alphaDiversity(dataCell,binAxis)

% Created by Li Jie.
% Date: 2018-4-25
% Calculate: Alpha Diversity over Abundance Bins.
% Method: 1). alpha-bins for each day; 2). average over days; 3). average over people.
% Copyright: Matteo, Li Jie, Hokkaido University.

for i = 1:size(dataCell,2)
    data = cell2mat(dataCell(i));
    for j = 1:size(data,2)
        diversityPersonDay(1,j) = length(find(data(:,j) == 0));
        for jj = 2:length(binAxis)
            diversityPersonDay(jj,j) = length(find(data(:,j) > binAxis(jj-1) & data(:,j) <= binAxis(jj)));
        end
    end
    diversityMeanOverDay(i,:) = mean(diversityPersonDay,2);
end
diversityMean = mean(diversityMeanOverDay,1);
