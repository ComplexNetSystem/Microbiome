function betaDiversityMean = betaCalculation(dataCellCell,abdRange)

% Created by Li Jie
% Date: 2018-4-29
% Calculate: Beta over Abundance.
% Note: The same with the function betaDiversity.m. But this is better for calculation WITHOUT specific species names (strings).
% Copyright: Matteo, Li Jie, Hokkaido University.

betaDiversityPeople_Bins = zeros(size(dataCellCell,2),length(abdRange)-1);

for i = 1:size(dataCellCell,2)
    dataCellPeople = dataCellCell{i};
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));
    
    dataIndexBin_pre = find(dataPeople >= abdRange(1) & dataPeople <= abdRange(2)); 
    % dataIndexBin_pre = find(dataPeople > abdRange(1) & dataPeople <= abdRange(2)); % considering neglecting abdRange(1) == 0. No difference in figures.
    speciesIndexBin_pre = unique(mod(dataIndexBin_pre,size(dataPeople,1))) + 1; %% "+1": consider the text in 1st row.
    
    for iii = 2:length(abdRange)-1
        dataIndexBin = find(dataPeople > abdRange(iii) & dataPeople <= abdRange(iii+1));
        if length(dataIndexBin) == 0
            betaDiversityPeople_Bins(i,iii) = 0;
        else
            speciesIndexBin_this = unique(mod(dataIndexBin,size(dataPeople,1))) + 1; %% "+1": consider the text in 1st row.

            % Compare speciesIndexBin_this with speciesIndexBin_last
            isMember = ismember(speciesIndexBin_this,speciesIndexBin_pre);
            common_count = length(find(isMember == 1));
            species_count = length(speciesIndexBin_pre) + length(find(isMember == 0));
            
            betaDiversityPeople_Bins(i,iii) = common_count/species_count;
            speciesIndexBin_pre = unique([speciesIndexBin_pre;speciesIndexBin_this]); clear speciesIndexBin_this  % BUG: CLEAR is VERY important!!!
            % speciesIndexBin_pre = speciesIndexBin_this;
        end   
    end
end

betaDiversityMean = mean(betaDiversityPeople_Bins,1);
