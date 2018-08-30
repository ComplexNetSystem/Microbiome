function gamma = gammaCal(dataCellCell)

speciesName1 = dataCellCell{1}(2:end,1);
abdData1 = cell2mat(dataCellCell{1}(2:end,2:end));
[row1,clm1] = size(abdData1);
speciesName2 = dataCellCell{2}(2:end,1);
abdData2 = cell2mat(dataCellCell{2}(2:end,2:end));
[row2,clm2] = size(abdData2);

gamma = zeros(1,max(clm1,clm2));

species_Today1 = speciesName1(find(abdData1(:,1) ~= 0));
species_Today2 = speciesName2(find(abdData2(:,1) ~= 0));
species_Today = unique([species_Today1;species_Today2]);
species_Pre = species_Today;
gamma(1) = length(species_Pre);
clear species_Today species_Today1 species_Today2
for i = 2 : max(clm1,clm2)
    if i <= clm1 && i <= clm2
        species_Today1 = speciesName1(find(abdData1(:,i) ~= 0));
        species_Today2 = speciesName2(find(abdData2(:,i) ~= 0));
        species_Today = unique([species_Today1;species_Today2]);
        species_Pre = unique([species_Pre;species_Today]);
        clear species_Today species_Today1 species_Today2
        gamma(i) = length(species_Pre);
    elseif i <= clm1 && i > clm2
        species_Today = unique(speciesName1(find(abdData1(:,i) ~= 0)));
        species_Pre = unique([species_Pre;species_Today]);clear species_Today
        gamma(i) = length(species_Pre);
    elseif i > clm1 && i <= clm2
        species_Today = unique(speciesName2(find(abdData2(:,i) ~= 0)));
        species_Pre = unique([species_Pre;species_Today]);clear species_Today
        gamma(i) = length(species_Pre);
    else
        break;
    end
end
