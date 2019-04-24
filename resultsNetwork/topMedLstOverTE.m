clear all
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
h_H = Output.H;h_TE = Output.T;hTimeSeries = x;
outputFile = 'output_Transitory_Group'; load(outputFile);
t_H = Output.H;t_TE = Output.T;tTimeSeries = x;
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
u_H = Output.H;u_TE = Output.T;uTimeSeries = x;
                                
[hSigmaArr,hMiuArr,hTotalEntArrEachNode] = sigmaMiuFunc(h_H,h_TE);
[tSigmaArr,tMiuArr,tTotalEntArrEachNode] = sigmaMiuFunc(t_H,t_TE);
[uSigmaArr,uMiuArr,uTotalEntArrEachNode] = sigmaMiuFunc(u_H,u_TE);

[hSortEntArr,hIndexEnt] = sort(hTotalEntArrEachNode,'descend'); 
[tSortEntArr,tIndexEnt] = sort(tTotalEntArrEachNode,'descend'); 
[uSortEntArr,uIndexEnt] = sort(uTotalEntArrEachNode,'descend'); 

% Top 10       1 : 10
figure;
hTimeSeriesTop10Ent = hTimeSeries(:,hIndexEnt(1:10)); 
% hAveAbdOverTime = reshape(hTimeSeriesTop10Ent,size(hTimeSeriesTop10Ent,1)*size(hTimeSeriesTop10Ent,2),1);
hAveAbdOverTime = mean(hTimeSeriesTop10Ent,2);
[hTopAbdAxis,hTopAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0012,'b','o');
tTimeSeriesTop10Ent = tTimeSeries(:,tIndexEnt(1:10)); tAveAbdOverTime = mean(tTimeSeriesTop10Ent,2);
[tTopAbdAxis,tTopAbdPdenf] = plpdf_Parameter1(tAveAbdOverTime(1:15)',0.00003,[0 185/255 0],'o');
uTimeSeriesTop10Ent = uTimeSeries(:,uIndexEnt(1:10)); uAveAbdOverTime = mean(uTimeSeriesTop10Ent,2);
[uTopAbdAxis,uTopAbdPdenf] = plpdf_Parameter1(uAveAbdOverTime(1:14)',0.00001,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

figure;
hAveTopTE = mean(h_TE(hIndexEnt(1:10),:),1);[hTopTEAxis,hTopTEPdenf] = plpdf_Parameter1(hAveTopTE,0.2,'b','o');
tAveTopTE = mean(t_TE(tIndexEnt(1:10),:),1);[tTopTEAxis,tTopTEPdenf] = plpdf_Parameter1(tAveTopTE,0.3,[0 185/255 0],'o');
uAveTopTE = mean(u_TE(uIndexEnt(1:10),:),1);[uTopTEAxis,uTopTEPdenf] = plpdf_Parameter1(uAveTopTE,0.2,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')
% plot(aveAbdOverTime,'color','b','LineWidth',3);hold on  % Healthy
% plot(aveAbdOverTime(1:15),'color',[0 185/255 0],'LineWidth',3);  % % Transitory
% plot(aveAbdOverTime(1:14),'color','r','LineWidth',3);   % Unhealthy

% Middle 10  
figure;
hTimeSeriesMid10Ent = hTimeSeries(:,hIndexEnt(20:29)); hAveAbdOverTime = mean(hTimeSeriesMid10Ent,2);
[hMidAbdAxis,hMidAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0015,'b','o');
tTimeSeriesMid10Ent = tTimeSeries(:,tIndexEnt(47:56)); tAveAbdOverTime = mean(tTimeSeriesMid10Ent,2);
[tMidAbdAxis,tMidAbdPdenf] = plpdf_Parameter1(tAveAbdOverTime(1:15)',0.001,[0 185/255 0],'o');
uTimeSeriesMid10Ent = uTimeSeries(:,uIndexEnt(58:67)); uAveAbdOverTime = mean(uTimeSeriesMid10Ent,2);
[uMidAbdAxis,uMidAbdPdenf] = plpdf_Parameter1(uAveAbdOverTime(1:14)',0.0002,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

figure;
hAveMidTE = mean(h_TE(hIndexEnt(20:29),:),1);[hMidTEAxis,hMidTEPdenf] = plpdf_Parameter1(hAveMidTE,0.2,'b','o');
tAveMidTE = mean(t_TE(tIndexEnt(47:56),:),1);[tMidTEAxis,tMidTEPdenf] = plpdf_Parameter1(tAveMidTE,0.2,[0 185/255 0],'o');
uAveMidTE = mean(u_TE(uIndexEnt(58:67),:),1);[uMidTEAxis,uMidTEPdenf] = plpdf_Parameter1(uAveMidTE,0.2,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')
% Least 10   end-9  :  end
figure;
hTimeSeriesLst10Ent = hTimeSeries(:,hIndexEnt(end-9:end)); hAveAbdOverTime = mean(hTimeSeriesLst10Ent,2);
[hLstAbdAxis,hLstAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0012,'b','o');
tTimeSeriesTop10Ent = tTimeSeries(:,tIndexEnt(end-9:end)); tAveAbdOverTime = mean(tTimeSeriesTop10Ent,2);
[tLstAbdAxis,tLstAbdPdenf] = plpdf_Parameter1(tAveAbdOverTime(1:15)',0.002,[0 185/255 0],'o');
uTimeSeriesTop10Ent = uTimeSeries(:,uIndexEnt(end-9:end)); uAveAbdOverTime = mean(uTimeSeriesTop10Ent,2);
[uLstAbdAxis,uLstAbdPdenf] = plpdf_Parameter1(uAveAbdOverTime(1:14)',0.0015,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')
close all
figure;
hAveLstTE = mean(h_TE(hIndexEnt(end-9:end),:),1);[hLstTEAxis,hLstTEPdenf] = plpdf_Parameter1(hAveLstTE,0.2,'b','o');
tAveLstTE = mean(t_TE(tIndexEnt(end-9:end),:),1);[tLstTEAxis,tLstTEPdenf] = plpdf_Parameter1(tAveLstTE,0.2,[0 185/255 0],'o');
uAveLstTE = mean(u_TE(uIndexEnt(end-9:end),:),1);[uLstTEAxis,uLstTEPdenf] = plpdf_Parameter1(uAveLstTE,0.2,'r','o'); 
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

