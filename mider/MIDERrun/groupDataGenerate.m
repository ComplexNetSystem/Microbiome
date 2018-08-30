clear all
[hDataCell,hTextCellCell,pDataCell,pTextCellCell] = rdxlsx_value_species('D:\project\Matlab\Microbiome\data4Person\IBS');
allDataCell = [hDataCell,pDataCell]; allTextCellCell = [hTextCellCell,pTextCellCell];


hTimeArr4Indi = timeLen4Indi(hDataCell);pTimeArr4Indi = timeLen4Indi(pDataCell);allTimeArr4Indi = timeLen4Indi(allDataCell);
hTimeLen = multi_lcm(hTimeArr4Indi);pTimeLen = multi_lcm(pTimeArr4Indi);allTimeLen = multi_lcm(allTimeArr4Indi);

hDataCell_norm = normDataCell(hDataCell,hTimeArr4Indi,hTimeLen);
pDataCell_norm = normDataCell(pDataCell,pTimeArr4Indi,pTimeLen);
allDataCell_norm = normDataCell(allDataCell,allTimeArr4Indi,allTimeLen);

[hData,hSpecies] = dataCombine(hDataCell_norm,hTextCellCell);
[pData,pSpecies] = dataCombine(pDataCell_norm,pTextCellCell);
[allData,allSpecies] = dataCombine(allDataCell_norm,allTextCellCell);