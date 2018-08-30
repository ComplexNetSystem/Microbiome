function [sigma,mu,totalTEofNode] = sigmaMuFunc(H_Data,TE_Data)

TE_Data(logical(eye(size(TE_Data)))) = 0;

allTEs = sum(sum(TE_Data));
allHs = sum(H_Data);
speciesNum = size(TE_Data,1);
totalTEofNode = zeros(speciesNum,1);
NTE = zeros(speciesNum,1);
sigma = zeros(speciesNum,1);
mu = zeros(speciesNum,1);
for i = 1:speciesNum
    % totalTEofNode(i) = H_Data(i) + sum(TE_Data(i,:)) + sum(TE_Data(:,i));
    % NTE(i) = sum(abs(TE_Data(:,i))) - sum(abs(TE_Data(i,:)));  %%% Update on 20 July.
    totalTEofNode(i) = sum(TE_Data(i,:));% + sum(TE_Data(:,i));
    sigma(i) = totalTEofNode(i) / (allHs + allTEs);
    mu(i) = H_Data(i) / (allHs + allTEs);
end
% totalEnt = totalEnt/max(totalEnt);
% sigma = sigma / max(sigma);
% mu = mu / max(mu);