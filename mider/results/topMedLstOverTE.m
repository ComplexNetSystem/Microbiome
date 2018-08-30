clear all
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
h_H = Output.H;h_TE = Output.T;hTimeSeries = x;
outputFile = 'output_Transitory_Group'; load(outputFile);
t_H = Output.H;t_TE = Output.T;tTimeSeries = x;
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
u_H = Output.H;u_TE = Output.T;uTimeSeries = x;
% OTE vs Abd ºÍ pdf of TE values ¼û  OTEvsAbdLogLog.m                  
[hSigmaArr,hMiuArr,hTEoutGoing] = sigmaMuFuncOutgoing(h_H,h_TE);
[tSigmaArr,tMiuArr,tTEoutGoing] = sigmaMuFuncOutgoing(t_H,t_TE);
[uSigmaArr,uMiuArr,uTEoutGoing] = sigmaMuFuncOutgoing(u_H,u_TE);
%% The scale of calculation is very large.
% hOTE_species = species_OTE(hTEoutGoing);
% tOTE_species = species_OTE(tTEoutGoing);
% uOTE_species = species_OTE(uTEoutGoing);



%--------- alpha Over OTE -----------%
hOTEMin = min(hTEoutGoing); hOTEMax = max(hTEoutGoing);
tOTEMin = min(tTEoutGoing); tOTEMax = max(tTEoutGoing);
uOTEMin = min(uTEoutGoing); uOTEMax = max(uTEoutGoing);

OTEMin = min([hOTEMin,tOTEMin,uOTEMin]);OTEmax = max([hOTEMax,tOTEMax,uOTEMax]);
numberOfBin = 50; OTEAxis = linspace(OTEMin,OTEmax,numberOfBin + 1);
hAlphaOTE = gammaOverOTE(hTEoutGoing,OTEAxis);
tAlphaOTE = gammaOverOTE(tTEoutGoing,OTEAxis);
uAlphaOTE = gammaOverOTE(uTEoutGoing,OTEAxis);

figure;scatter(OTEAxis(1:length(hAlphaOTE)),hAlphaOTE,80,'b','o','filled');hold on
scatter(OTEAxis(1:length(tAlphaOTE)),tAlphaOTE,80,[0 185/255 0],'o','filled');hold on
scatter(OTEAxis(1:length(uAlphaOTE)),uAlphaOTE,80,'r','o','filled');hold off
xlabel('OTE');ylabel('\gamma Diversity');set(gca,'FontSize',28);
% 
figure;
p_H = plDiversityFit(OTEAxis,hAlphaOTE,'o','b');
p_T = plDiversityFit(OTEAxis,tAlphaOTE,'*',[0,185/255,0]);
p_U = plDiversityFit(OTEAxis,uAlphaOTE,'+','r');
legend('Healthy',['Fit_H (k = ',num2str(p_H(1)),')'],'Transitory',['Fit_T (k = ',num2str(p_T(1)),')'],'Unhealthy',['Fit_U (k = ',num2str(p_U(1)),')']);
xlabel('OTE');ylabel('\alpha Diversity');set(gca,'FontSize',28);
% %--------- pdf -----------%
% hAlphaOTE_S = [hAlphaOTE*(-1),hAlphaOTE];
% tAlphaOTE_S = [tAlphaOTE*(-1),tAlphaOTE];
% uAlphaOTE_S = [uAlphaOTE*(-1),uAlphaOTE];
% figure;[axis,pdf] = plpdfModify(hAlphaOTE_S,0.4,'b','o');
% figure;[axis,pdf] = plpdfModify(tAlphaOTE_S,0.5,[0 185/255 0],'o'); 
% figure;[axis,pdf] = plpdfModify(uAlphaOTE_S,0.7,'r','o');



[hSortEntArr,hIndexEnt] = sort(hTEoutGoing,'descend'); 
[tSortEntArr,tIndexEnt] = sort(tTEoutGoing,'descend'); 
[uSortEntArr,uIndexEnt] = sort(uTEoutGoing,'descend'); 


%%
%--------pdf of OTE for TOP/INTERMEDIATE/LEAST 10.--------% 
%-----pdf of Abundance for TOP/INTERMEDIATE/LEAST 10.-----%    
%% Top 10       1 : 10
figure;
hTimeSeriesTop10Ent = hTimeSeries(:,hIndexEnt(1:10)); hAveAbdOverTime = mean(hTimeSeriesTop10Ent,2);
[hTopAbdAxis,hTopAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0008,'b','o');hold on
tTimeSeriesTop10Ent = tTimeSeries(:,tIndexEnt(1:10)); tAveAbdOverTime = mean(tTimeSeriesTop10Ent,2);
[tTopAbdAxis,tTopAbdPdenf] = plpdfModify([tAveAbdOverTime(1:15);-1 * tAveAbdOverTime(1:15)]',0.00002,[0 185/255 0],'o');hold on
uTimeSeriesTop10Ent = uTimeSeries(:,uIndexEnt(1:10)); uAveAbdOverTime = mean(uTimeSeriesTop10Ent,2);
[uTopAbdAxis,uTopAbdPdenf] = plpdfModify([uAveAbdOverTime(1:14);-1 * uAveAbdOverTime(1:14)]',0.00002,'r','o'); hold off
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

% figure;
% hTimeSeriesTop10Ent = hTimeSeries(:,hIndexEnt(1:10)); 
% hAveAbdOverTime = reshape(hTimeSeriesTop10Ent,size(hTimeSeriesTop10Ent,1)*size(hTimeSeriesTop10Ent,2),1);
% hAveAbdOverTime = [hAveAbdOverTime;-1*hAveAbdOverTime];[hTopAbdAxis,hTopAbdPdenf] = plpdfModify(hAveAbdOverTime',0.001,'b','o');hold on
% tTimeSeriesTop10Ent = tTimeSeries(1:15,tIndexEnt(1:10)); 
% tAveAbdOverTime = reshape(tTimeSeriesTop10Ent,size(tTimeSeriesTop10Ent,1)*size(tTimeSeriesTop10Ent,2),1);
% tAveAbdOverTime = [tAveAbdOverTime;-1*tAveAbdOverTime];[tTopAbdAxis,tTopAbdPdenf] = plpdfModify(tAveAbdOverTime',0.0003,[0 185/255 0],'o');hold on
% uTimeSeriesTop10Ent = uTimeSeries(1:14,uIndexEnt(1:10)); 
% uAveAbdOverTime = reshape(uTimeSeriesTop10Ent,size(uTimeSeriesTop10Ent,1)*size(uTimeSeriesTop10Ent,2),1);
% uAveAbdOverTime = [uAveAbdOverTime;-1*uAveAbdOverTime];[uTopAbdAxis,uTopAbdPdenf] = plpdfModify(uAveAbdOverTime',0.002,'r','o'); hold off
% legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

figure;
% hAveTopTE = reshape([h_TE(hIndexEnt(1:10),:);h_TE(:,hIndexEnt(1:10))'],1,10*length(h_TE)*2);
hAveTopTE = reshape(h_TE(hIndexEnt(1:10),:),1,10*length(h_TE));
[hTopTEAxis,hTopTEPdenf] = plpdf_Parameter1(hAveTopTE,0.16,'b','o');hold on
% tAveTopTE = reshape([t_TE(tIndexEnt(1:10),:);t_TE(:,tIndexEnt(1:10))'],1,10*length(t_TE)*2);
tAveTopTE = reshape(t_TE(tIndexEnt(1:10),:),1,10*length(t_TE));
[tTopTEAxis,tTopTEPdenf] = plpdf_Parameter1(tAveTopTE,0.16,[0 185/255 0],'o');hold on
% uAveTopTE = reshape([u_TE(uIndexEnt(1:10),:);u_TE(:,uIndexEnt(1:10))'],1,10*length(u_TE)*2);
uAveTopTE = reshape(u_TE(uIndexEnt(1:10),:),1,10*length(u_TE));
[uTopTEAxis,uTopTEPdenf] = plpdf_Parameter1(uAveTopTE,0.16,'r','o'); hold off
legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')


%% Middle 10  
% figure;
% hTimeSeriesMid10Ent = hTimeSeries(:,hIndexEnt(20:29)); hAveAbdOverTime = mean(hTimeSeriesMid10Ent,2);
% [hMidAbdAxis,hMidAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0008,'b','o');hold on
% tTimeSeriesMid10Ent = tTimeSeries(:,tIndexEnt(47:56)); tAveAbdOverTime = mean(tTimeSeriesMid10Ent,2);
% [tMidAbdAxis,tMidAbdPdenf] = plpdf_Parameter1(tAveAbdOverTime(1:15)',0.001,[0 185/255 0],'o');hold on
% uTimeSeriesMid10Ent = uTimeSeries(:,uIndexEnt(58:67)); uAveAbdOverTime = mean(uTimeSeriesMid10Ent,2);
% [uMidAbdAxis,uMidAbdPdenf] = plpdfModify([uAveAbdOverTime(1:14);-1 * uAveAbdOverTime(1:14)]',0.0002,'r','o'); hold off
% legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

% figure; %% TE-PDF
% % hAveMidTE = reshape([h_TE(hIndexEnt(20:29),:);h_TE(:,hIndexEnt(20:29))'],1,10*length(h_TE)*2);
% hAveMidTE = reshape(h_TE(hIndexEnt(20:29),:),1,10*length(h_TE));
% [hMidTEAxis,hMidTEPdenf] = plpdf_Parameter1(hAveMidTE,0.16,'b','o');hold on
% % tAveMidTE = reshape([t_TE(tIndexEnt(47:56),:);t_TE(:,tIndexEnt(47:56))'],1,10*length(t_TE)*2);
% tAveMidTE = reshape(t_TE(tIndexEnt(47:56),:),1,10*length(t_TE));
% [tMidTEAxis,tMidTEPdenf] = plpdf_Parameter1(tAveMidTE,0.16,[0 185/255 0],'o');hold on
% % uAveMidTE = reshape([u_TE(uIndexEnt(58:67),:);u_TE(:,uIndexEnt(58:67))'],1,10*length(u_TE)*2);
% uAveMidTE = reshape(u_TE(uIndexEnt(58:67),:),1,10*length(u_TE));
% [uMidTEAxis,uMidTEPdenf] = plpdf_Parameter1(uAveMidTE,0.16,'r','o'); hold off
% legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')


%% Least 10   end-9  :  end
% figure;
% hTimeSeriesLst10Ent = hTimeSeries(:,hIndexEnt(end-9:end)); hAveAbdOverTime = mean(hTimeSeriesLst10Ent,2);
% [hLstAbdAxis,hLstAbdPdenf] = plpdf_Parameter1(hAveAbdOverTime',0.0008,'b','o');hold on
% tTimeSeriesLst10Ent = tTimeSeries(:,tIndexEnt(end-9:end)); tAveAbdOverTime = mean(tTimeSeriesLst10Ent,2);
% [tLstAbdAxis,tLstAbdPdenf] = plpdf_Parameter1(tAveAbdOverTime(1:15)',0.002,[0 185/255 0],'o');hold on
% uTimeSeriesLst10Ent = uTimeSeries(:,uIndexEnt(end-9:end)); uAveAbdOverTime = mean(uTimeSeriesLst10Ent,2);
% [uLstAbdAxis,uLstAbdPdenf] = plpdf_Parameter1(uAveAbdOverTime(1:14)',0.002,'r','o'); hold off
% legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')


% figure; %% TE-PDF
% % hAveLstTE = reshape([h_TE(hIndexEnt(end-9:end),:);h_TE(:,hIndexEnt(end-9:end))'],1,10*length(h_TE)*2);
% hAveLstTE = reshape(h_TE(hIndexEnt(end-9:end),:),1,10*length(h_TE));
% [hLstTEAxis,hLstTEPdenf] = plpdf_Parameter1(hAveLstTE,0.16,'b','o');hold on
% % tAveLstTE = reshape([t_TE(tIndexEnt(end-9:end),:);t_TE(:,tIndexEnt(end-9:end))'],1,10*length(t_TE)*2);
% tAveLstTE = reshape(t_TE(tIndexEnt(end-9:end),:),1,10*length(t_TE));
% [tLstTEAxis,tLstTEPdenf] = plpdf_Parameter1(tAveLstTE,0.16,[0 185/255 0],'o');hold on
% % uAveLstTE = reshape([u_TE(uIndexEnt(end-9:end),:);u_TE(:,uIndexEnt(end-9:end))'],1,10*length(u_TE)*2);
% uAveLstTE = reshape(u_TE(uIndexEnt(end-9:end),:),1,10*length(u_TE));
% [uLstTEAxis,uLstTEPdenf] = plpdf_Parameter1(uAveLstTE,0.16,'r','o'); hold off
% legend('Healthy','pdf_H','Transitory','pdf_T','Unhealthy','pdf_U')

