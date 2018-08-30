function meanBetaOverNumber = meanBetaOverNumberFunc(allMeanDataPeople)

meanBetaOverNumber = zeros(1,length(allMeanDataPeople));
for i = 1:length(allMeanDataPeople)
    meanBetaOverNumber(i) = mean(mean(nchoosek(allMeanDataPeople,i)));
end
