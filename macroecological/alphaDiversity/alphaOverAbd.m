function alphaValueAbd = alphaOverAbd(dataCell,binAxis)

% Created by Li Jie. Update for the function of alphaDiversity.m
% Date: 2018-4-29
% Calculate: Alpha Diversity over Abundance Bins.
% Method: 1). alpha-bins for all days; 2). average over people.
% Note: Don't need to separately calculate across each day. It's BETTER.
% Copyright: Matteo, Li Jie, Hokkaido University.

alphaDiversityPeople_Bins = zeros(size(dataCell,2),length(binAxis)-1);
for i = 1:size(dataCell,2)
    data = cell2mat(dataCell(i));
    alphaDiversityPeople_Bins(i,1) = length(find(data >= binAxis(1) & data <= binAxis(2)));
    % alphaDiversityPeople_Bins(i,1) = length(find(data > binAxis(1) & data <= binAxis(2))); % Consider neglecting binAxis(1) == 0
    for j = 2:length(binAxis)-1
        alphaDiversityPeople_Bins(i,j) = length(find(data > binAxis(j) & data <= binAxis(j+1)));
    end
end

alphaValueAbd = alphaDiversityPeople_Bins(1,:);
for ii = 2:size(dataCell,2)
    alphaValueAbd = [alphaValueAbd,alphaDiversityPeople_Bins(ii,:)];
end
