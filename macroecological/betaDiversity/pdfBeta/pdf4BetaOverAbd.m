clear all

% ******** Set the bandwidth of the function of kde() in plpdfModify.m *******% 
%  ^^^^^^^^^^^^^ 0.002^^^^^^^^^^^^^^^^^^%

numberOfBin = 100; % Set.
%% Read all .xlsx files in specified path.
[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

[h_minAbd,h_maxAbd] = betaAbdRange(hDataCellCell);
[t_minAbd,t_maxAbd] = betaAbdRange(tDataCellCell);
[p_minAbd,p_maxAbd] = betaAbdRange(pDataCellCell);

minAbd = min([h_minAbd,t_minAbd,p_minAbd]);
maxAbd = max([h_maxAbd,t_maxAbd,p_maxAbd]);
abdAxis = linspace(minAbd,maxAbd,numberOfBin+1); 

hBetaValueAbd = betaOverAbd(hDataCellCell,abdAxis);hBetaValueAbd_S = [hBetaValueAbd*(-1),hBetaValueAbd];
tBetaValueAbd = betaOverAbd(tDataCellCell,abdAxis);tBetaValueAbd_S = [tBetaValueAbd*(-1),tBetaValueAbd];
pBetaValueAbd = betaOverAbd(pDataCellCell,abdAxis);pBetaValueAbd_S = [pBetaValueAbd*(-1),pBetaValueAbd];
% allBetaValueAbd = [hBetaValueAbd,pBetaValueAbd];allBetaValueAbd_S = [allBetaValueAbd*(-1),allBetaValueAbd];

[hBetaAxisAbd,hPdenfAbd] = plpdfModify(hBetaValueAbd_S,0.06,0,1,'Healthy'); % title('Hist. & pdf of \beta Diversity Over Abundance (Healthy)')
[tBetaAxisAbd,tPdenfAbd] = plpdfModify(tBetaValueAbd_S,0.06,0,1,'Transitory'); % title('Hist. & pdf of \beta Diversity Over Abundance (Transitory)')
[pBetaAxisAbd,pPdenfAbd] = plpdfModify(pBetaValueAbd_S,0.06,0,1,'Unhealthy'); % title('Hist. & pdf of \beta Diversity Over Abundance (Unhealthy)')

