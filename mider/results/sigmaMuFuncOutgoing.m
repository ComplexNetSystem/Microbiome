function [sigma,mu,TEOutGoing] = sigmaMuFuncOutgoing(H_Data,TE_Data)

TE_Data(logical(eye(size(TE_Data)))) = 0;

allTEs = sum(sum(TE_Data));
allHs = sum(H_Data);
speciesNum = size(TE_Data,1);
% totalTEofNodeOutGoing = zeros(speciesNum,1);
TEOutGoing = zeros(speciesNum,1);
sigma = zeros(speciesNum,1);
mu = zeros(speciesNum,1);
for i = 1:speciesNum
    % totalTEofNode(i) = H_Data(i) + sum(TE_Data(i,:)) + sum(TE_Data(:,i));
    % TEOutGoing(i) = sum(abs(TE_Data(i,:)));
    TEOutGoing(i) = sum(TE_Data(i,:));
    % totalTEofNodeOutGoing(i) = sum(TE_Data(i,:));
    sigma(i) = TEOutGoing(i) / (allHs + allTEs);
    mu(i) = H_Data(i) / (allHs + allTEs);
end
% totalEnt = totalEnt/max(totalEnt);
% sigma = sigma / max(sigma);
% mu = mu / max(mu);