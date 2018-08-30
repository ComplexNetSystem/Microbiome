clear all
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
h_H = Output.H;h_TE = Output.T;hTimeSeries = x;
outputFile = 'output_Transitory_Group'; load(outputFile);
t_H = Output.H;t_TE = Output.T;tTimeSeries = x;
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
u_H = Output.H;u_TE = Output.T;uTimeSeries = x;

[hSigmaArr,hMuArr,hTEoutGoing] = sigmaMuFuncOutgoing(h_H,h_TE);
[tSigmaArr,tMuArr,tTEoutGoing] = sigmaMuFuncOutgoing(t_H,t_TE);
[uSigmaArr,uMuArr,uTEoutGoing] = sigmaMuFuncOutgoing(u_H,u_TE);
% [hSigmaArr,hMuArr,hNTE] = sigmaMuFunc(h_H,h_TE);
% [tSigmaArr,tMuArr,tNTE] = sigmaMuFunc(t_H,t_TE);
% [uSigmaArr,uMuArr,uNTE] = sigmaMuFunc(u_H,u_TE);
% 
% figure;
% [aa,bb] = plpdf_Parameter1(hNTE',2,'b','o');hold on
% [aa,bb] = plpdf_Parameter1(tNTE',4,[0 185/255 0],'o');hold on
% [aa,bb] = plpdf_Parameter1(uNTE',6,'r','o');hold off
% legend('Healthy','Healthy','Transitory','Transitory','Unhealthy','Unhealthy')


%%%-------------sigma-mu---------------%%%
maxSigma = max(abs([hSigmaArr;tSigmaArr;uSigmaArr]));
hSigmaArr = hSigmaArr/maxSigma;tSigmaArr = tSigmaArr/maxSigma;uSigmaArr = uSigmaArr/maxSigma;
maxMu = max(abs([hMuArr;tMuArr;uMuArr]));
hMuArr = hMuArr/maxMu;tMuArr = tMuArr/maxMu;uMuArr = uMuArr/maxMu;
% -----------------------
figure
scatter(hMuArr,hSigmaArr,60,'b','filled');hold on %[0 185/255 0]
plot([0,1],[0,1],'LineWidth',3,'color','black');
xlabel('\mu');ylabel('\sigma');set(gca,'FontSize',28);ylim([-0.5 1]);title('\sigma-\mu (Healthy-Outgoing)')
hold off
figure;
scatter(tMuArr,tSigmaArr,60,[0 185/255 0],'filled');hold on
plot([0,1],[0,1],'LineWidth',3,'color','black');
xlabel('\mu');ylabel('\sigma');set(gca,'FontSize',28);ylim([-0.5 1]);title('\sigma-\mu (Transitory-Outgoing)')
hold off
figure;
scatter(uMuArr,uSigmaArr,60,'r','filled');hold on
plot([0,1],[0,1],'LineWidth',3,'color','black');
xlabel('\mu');ylabel('\sigma');set(gca,'FontSize',28);ylim([-0.5 1]);title('\sigma-\mu (Unhealthy-Outgoing)')
hold off



%%%-------------pdf-OTE(Sum of total Outgoing Transfer Entropy)---------------%%%
[hSortEntArr,hIndexEnt] = sort(hTEoutGoing,'descend'); 
[tSortEntArr,tIndexEnt] = sort(tTEoutGoing,'descend'); 
[uSortEntArr,uIndexEnt] = sort(uTEoutGoing,'descend'); 
figure;
[aa,bb] = plpdf_Parameter1(hSortEntArr(1:10)',2,'b','o');hold on
[aa,bb] = plpdf_Parameter1(tSortEntArr(1:10)',2,[0 185/255 0],'o');hold on
[aa,bb] = plpdf_Parameter1(uSortEntArr(1:10)',2,'r','o');hold off
legend('Healthy','Healthy','Transitory','Transitory','Unhealthy','Unhealthy')
figure;
[aa,bb] = plpdf_Parameter1(hSortEntArr(20:29)',0.6,'b','o');hold on
[aa,bb] = plpdf_Parameter1(tSortEntArr(47:56)',0.7,[0 185/255 0],'o');hold on
[aa,bb] = plpdf_Parameter1(uSortEntArr(58:67)',1.8,'r','o');hold off
legend('Healthy','Healthy','Transitory','Transitory','Unhealthy','Unhealthy')
figure;
[aa,bb] = plpdf_Parameter1(hSortEntArr(end-9:end)',1,'b','o');hold on
[aa,bb] = plpdf_Parameter1(tSortEntArr(end-9:end)',1,[0 185/255 0],'o');hold on
[aa,bb] = plpdf_Parameter1(uSortEntArr(end-9:end)',1,'r','o');hold off
legend('Healthy','Healthy','Transitory','Transitory','Unhealthy','Unhealthy')




