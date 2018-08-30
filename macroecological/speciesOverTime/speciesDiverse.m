function [diverse,events,common] = speciesDiverse(rawCell)

% Calculate the diverse, events and species of the 1st day.
rawDataDay = cell2mat(rawCell(2:end,2));
row = find(rawDataDay ~= 0) + 1;  %% "+1": consider the text in 1st row.
diverse = zeros(1,size(rawCell,2)-1);events = zeros(1,size(rawCell,2)-1);
common = zeros(1,size(rawCell,2)-1);
diverse(1) = length(row); events(1) = diverse(1);
for i = 1:length(row)
        species_pre(i) = rawCell(row(i),1);
end
species_yesterday = species_pre;

for ii = 3:size(rawCell,2)
    rawDataDay = cell2mat(rawCell(2:end,ii));
    row = find(rawDataDay ~= 0) + 1;  %% "+1": consider the text in 1st row.
    for jj = 1:length(row)
        species_today(jj) = rawCell(row(jj),1);
    end
    % To find the difference between species_today and species_pre.
    % Note: Just using Index for calculation is better. Need to Improve to speed up.
    count = 0;
    for j = 1:length(species_today)
        isExist = strcmp(species_pre,species_today{j});
        if sum(isExist) == 0    %% need to improve. not exist
            count = count + 1;
        else
            continue;
        end
    end
    
    diverse(ii-1) = diverse(ii-2) + count;
    events(ii-1) = events(ii-2) + length(species_today);
    species_pre = [species_pre,species_today];
    
    common_count = 0;
    for m = 1:length(species_today)
        isExist = strcmp(species_yesterday,species_today{m});
        if sum(isExist) == 0    %% need to improve. common
            continue;
        elseif sum(isExist) > 0
            common_count = common_count + 1;
        end
    end
    common(ii-1) = common_count;
    species_yesterday = species_today; clear species_today  % BUG: CLEAR is VERY important!!!
end

% function compareCell(Acell,Bcell)

