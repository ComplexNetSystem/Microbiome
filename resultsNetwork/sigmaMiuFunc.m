function [sigma,miu,totalEnt] = sigmaMiuFunc(H_Data,TE_Data)

TE_Data(logical(eye(size(TE_Data)))) = 0;
allTEs = sum(sum(TE_Data));
allHs = sum(H_Data);
speciesNum = size(TE_Data,1);
totalEnt = zeros(speciesNum,1);
sigma = zeros(speciesNum,1);
miu = zeros(speciesNum,1);
for i = 1:speciesNum
    % totalEnt(i) = H_Data(i) + sum(TE_Data(i,:));
    totalEnt(i) = sum(TE_Data(i,:));
    sigma(i) = sum(TE_Data(i,:)) / (allHs + allTEs);
    % sigma(i) = sum(TE_Data(i,:)) / (H_Data(i) + sum(TE_Data(i,:)));
    miu(i) = H_Data(i) / (allHs + allTEs);
    % miu(i) = H_Data(i) / (H_Data(i) + sum(TE_Data(i,:)));
end
% totalEnt = totalEnt/max(totalEnt);
sigma = sigma / max(sigma);
miu = miu / max(miu);