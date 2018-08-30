clear all

% ******** Set the bandwidth of the function of kde() in plpdfModify.m *******% 
%  ^^^^^^^^^^^^^ 0.02^^^^^^^^^^^^^^^^^^%

[hDataCellCell,tDataCellCell,pDataCellCell] = rdxlsx2cell('D:\project\Matlab\Microbiome\data4Person\IBS');

hBetaValue = betaOverData(hDataCellCell);% hBetaValue_S = [hBetaValue*(-1),hBetaValue];
tBetaValue = betaOverData(tDataCellCell);% tBetaValue_S = [tBetaValue*(-1),tBetaValue];
pBetaValue = betaOverData(pDataCellCell);% pBetaValue_S = [pBetaValue*(-1),pBetaValue];

[hBetaAxis,hPdenf] = plpdf_Parameter(hBetaValue,0.06,0,1,'Healthy'); 
[tBetaAxis,tPdenf] = plpdf_Parameter(tBetaValue,0.04,0,1,'Transitory');
[pBetaAxis,pPdenf] = plpdf_Parameter(pBetaValue,0.06,0,1,'Unhealthy');


