function aveOTE_species = species_OTE(OTEdata)
%% The scale of calculation is very large.
index = [1:length(OTEdata)];
aveOTE_species = zeros(1,length(OTEdata));
for i = 1:length(OTEdata)
    combine = nchoosek(index,i);
    aveOTE_species(i) = mean(sum(OTEdata(combine),2));
end
