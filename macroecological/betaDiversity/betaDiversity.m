function betaDiversityMean = betaDiversity(dataCellCell,abdRange)

% Created by Li Jie
% Date: 2018-4-29
% Calculate: Beta over Abundance.
% Note: Calculaton WITH specific species names.
% Copyright: Matteo, Li Jie, Hokkaido University.

betaDiversityPeople_Bins = zeros(size(dataCellCell,2),length(abdRange)-1);

for i = 1:size(dataCellCell,2)
    dataCellPeople = dataCellCell{i};
    dataPeople = cell2mat(dataCellPeople(2:end,2:end));
    
    dataIndexBin_pre = find(dataPeople >= abdRange(1) & dataPeople <= abdRange(2));
    speciesIndexBin_pre = unique(mod(dataIndexBin_pre,size(dataPeople,1))) + 1; %% "+1": consider the text in 1st row.
    for ii = 1:length(speciesIndexBin_pre)
        speciesBin_pre(ii) = dataCellPeople(speciesIndexBin_pre(ii),1);
    end
    % speciesBin_last = speciesBin_pre;
    
    for iii = 2:length(abdRange)-1
        dataIndexBin = find(dataPeople > abdRange(iii) & dataPeople <= abdRange(iii+1));
        if length(dataIndexBin) == 0
            betaDiversityPeople_Bins(i,iii) = 0;
        else
            speciesIndexBin = unique(mod(dataIndexBin,size(dataPeople,1))) + 1; %% "+1": consider the text in 1st row.
            for jj = 1:length(speciesIndexBin)
                speciesBin_this(jj) = dataCellPeople(speciesIndexBin(jj),1);
            end
            % Compare speciesBin_this with speciesBin_pre
            common_count = 0; species_count = length(speciesBin_pre);
            for j = 1:length(speciesBin_this)
                isExist = strcmp(speciesBin_pre,speciesBin_this{j});
                if sum(isExist) == 0
                    species_count = species_count + 1;
                elseif sum(isExist) > 0   %% Exist
                    common_count = common_count + 1;
                end
            end
            betaDiversityPeople_Bins(i,iii) = common_count/species_count;
            speciesBin_pre = [speciesBin_pre,speciesBin_this]; clear speciesBin_this  % BUG: CLEAR is VERY important!!!
           %% Need to Unique operation for speciesBin_pre. Do it if needed. IMPORTANT!!!
        end   
    end
end

betaDiversityMean = mean(betaDiversityPeople_Bins,1);
