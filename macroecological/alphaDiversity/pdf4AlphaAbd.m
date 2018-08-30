clear all
numberOfBin = 100; % Set.
%% Read all .xlsx files in specified path.
[hDataCell,tDataCell,pDataCell] = rdxlsx2data('D:\project\Matlab\Microbiome\data4Person\IBS');

[h_minAbd,h_maxAbd] = alphaAbdRange(hDataCell);
[t_minAbd,t_maxAbd] = alphaAbdRange(tDataCell);
[p_minAbd,p_maxAbd] = alphaAbdRange(pDataCell);

minAbd = min([h_minAbd,t_minAbd,p_minAbd]);
maxAbd = max([h_maxAbd,t_maxAbd,p_maxAbd]);
% abdAxis = linspace(minAbd,maxAbd,numberOfBin);
abdAxis = linspace(minAbd,maxAbd,numberOfBin + 1);

hAlphaMeanAbd = alphaDiversityUpdate(hDataCell,abdAxis);hAlphaValueAbd_S = [hAlphaMeanAbd*(-1),hAlphaMeanAbd];
tAlphaMeanAbd = alphaDiversityUpdate(tDataCell,abdAxis);tAlphaValueAbd_S = [tAlphaMeanAbd*(-1),tAlphaMeanAbd];
pAlphaMeanAbd = alphaDiversityUpdate(pDataCell,abdAxis);pAlphaValueAbd_S = [pAlphaMeanAbd*(-1),pAlphaMeanAbd];
% allAlphaValueAbd = [hAlphaValueAbd,pAlphaValueAbd];allAlphaValueAbd_S = [allAlphaValueAbd*(-1),allAlphaValueAbd];

[hAlphaAxisAbd,hPdenfAbd] = plpdfModify(hAlphaValueAbd_S,1,0,100,'Healthy'); % title('Hist. & pdf of \alpha Diversity Over Abundance (Healthy)')
[tAlphaAxisAbd,tPdenfAbd] = plpdfModify(tAlphaValueAbd_S,1,0,100,'Transitory'); % title('Hist. & pdf of \alpha Diversity Over Abundance (Transitory)')
[pAlphaAxisAbd,pPdenfAbd] = plpdfModify(pAlphaValueAbd_S,1,0,100,'Unhealthy'); % title('Hist. & pdf of \alpha Diversity Over Abundance (Unhealthy)')

