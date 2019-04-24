clear all
% Prefix of Variables: h --> Healhty, p --> Patient with IBS; t --> Transitory 
%% Read all .xls Files and save the data as a cell variable.
% This line just processes the healthy and unhealthy individuals, if you want
% to have transitory data, please change some variables in this function:
% "rdxlsx_value_species".
[hDataCell,hTextCellCell,pDataCell,pTextCellCell] = rdxlsx_value_species('D:\project\Matlab\Microbiome\data4Person\IBS');

%% Find the length of time series for each individual and calculate the LCM
hTimeArr4Indi = timeLen4Indi(hDataCell);pTimeArr4Indi = timeLen4Indi(pDataCell);
hTimeLen = multi_lcm(hTimeArr4Indi);pTimeLen = multi_lcm(pTimeArr4Indi);

%% Extend time series of individuals at the length of LCM.
hDataCell_norm = normDataCell(hDataCell,hTimeArr4Indi,hTimeLen);
pDataCell_norm = normDataCell(pDataCell,pTimeArr4Indi,pTimeLen);

%% Combine them together in each group.
[hData,hSpecies] = dataCombine(hDataCell_norm,hTextCellCell);
[pData,pSpecies] = dataCombine(pDataCell_norm,pTextCellCell);

xlswrite('tGroupData.xls',hData);
xlswrite('pGroupData.xls',pData);
