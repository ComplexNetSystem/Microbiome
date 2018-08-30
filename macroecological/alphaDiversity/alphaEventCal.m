function [alpha,event] = alphaEventCal(dataCellCell)

speciesName1 = dataCellCell{1}(2:end,1);
abdData1 = cell2mat(dataCellCell{1}(2:end,2:end));
[row1,clm1] = size(abdData1);
speciesName2 = dataCellCell{2}(2:end,1);
abdData2 = cell2mat(dataCellCell{2}(2:end,2:end));
[row2,clm2] = size(abdData2);

alpha = zeros(1,max(clm1,clm2));event = zeros(1,max(clm1,clm2));

species_Today1 = speciesName1(find(abdData1(:,1) ~= 0));
species_Today2 = speciesName2(find(abdData2(:,1) ~= 0));
species_Today = unique([species_Today1;species_Today2]);
alpha(1) = length(species_Today);event(1) = alpha(1);
clear species_Today species_Today1 species_Today2
for i = 2 : max(clm1,clm2)
    if i <= clm1 && i <= clm2
        species_Today1 = speciesName1(find(abdData1(:,i) ~= 0));
        species_Today2 = speciesName2(find(abdData2(:,i) ~= 0));
        species_Today = unique([species_Today1;species_Today2]);
        alpha(i) = length(species_Today);
        event(i) = event(i-1) + alpha(i);
        clear species_Today species_Today1 species_Today2
    elseif i <= clm1 && i > clm2
        species_Today = unique(speciesName1(find(abdData1(:,i) ~= 0)));
        alpha(i) = length(species_Today);
        event(i) = event(i-1) + alpha(i);
        clear species_Today
    elseif i > clm1 && i <= clm2
        species_Today = unique(speciesName2(find(abdData2(:,i) ~= 0)));
        alpha(i) = length(species_Today);
        event(i) = event(i-1) + alpha(i);
        clear species_Today
    else
        break;
    end
end