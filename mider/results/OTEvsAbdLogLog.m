clear all
outputFile = 'output_Healthy_Group_withoutC_C1'; load(outputFile);
h_H = Output.H;h_TE = Output.T;hTimeSeries = x;
outputFile = 'output_Transitory_Group'; load(outputFile);
t_H = Output.H;t_TE = Output.T;tTimeSeries = x;
outputFile = 'output_Unhealthy_Group_withoutC_C1'; load(outputFile);
u_H = Output.H;u_TE = Output.T;uTimeSeries = x;

%-----pdf of TE for all pairs.-----%

% h_TE_Arr = reshape(deleteDiag(h_TE),1,length(h_TE)*(length(h_TE) - 1));
% t_TE_Arr = reshape(deleteDiag(t_TE),1,length(t_TE)*(length(t_TE) - 1));
% u_TE_Arr = reshape(deleteDiag(u_TE),1,length(u_TE)*(length(u_TE) - 1));
% 
% [a,b] = plpdf_Parameter1(h_TE_Arr,0.1,'b','o');hold on
% [a,b] = plpdf_Parameter1(t_TE_Arr,0.2,[0 185/255 0],'o');hold on
% [a,b] = plpdf_Parameter1(u_TE_Arr,0.3,'r','o');hold off
                  
[hSigmaArr,hMiuArr,hTEoutGoing] = sigmaMuFuncOutgoing(h_H,h_TE);
[tSigmaArr,tMiuArr,tTEoutGoing] = sigmaMuFuncOutgoing(t_H,t_TE);
[uSigmaArr,uMiuArr,uTEoutGoing] = sigmaMuFuncOutgoing(u_H,u_TE);

%% TE v.s. Abundance in Log-Log.
hMeanAbd = mean(hTimeSeries,1);
tMeanAbd = mean(tTimeSeries,1);
uMeanAbd = mean(uTimeSeries,1);

% hTEoutGoing = 160 - hTEoutGoing;tTEoutGoing = 160 - tTEoutGoing;uTEoutGoing = 160 - uTEoutGoing;
hTEoutGoing = 100 + hTEoutGoing;tTEoutGoing = 100 + tTEoutGoing;uTEoutGoing = 100 + uTEoutGoing;
% log(x),x<=0 brings a problem,so remove the negative data:

% hOTE_log_transform = sign(hTEoutGoing).*(log10(abs(hTEoutGoing)+1));
% tOTE_log_transform = sign(tTEoutGoing).*(log10(abs(tTEoutGoing)+1));
% uOTE_log_transform = sign(uTEoutGoing).*(log10(abs(uTEoutGoing)+1));
% 
% semilogx(hMeanAbd,hOTE_log_transform','bo','LineWidth',2,'MarkerSize',12);hold on
% semilogx(tMeanAbd,tOTE_log_transform','g*','LineWidth',2,'MarkerSize',12);hold on
% semilogx(uMeanAbd,uOTE_log_transform','r+','LineWidth',2,'MarkerSize',12);hold off

% hMeanAbd(hTEoutGoing <= 0) = [];hTEoutGoing(hTEoutGoing <= 0) = [];
% tMeanAbd(tTEoutGoing <= 0) = [];tTEoutGoing(tTEoutGoing <= 0) = [];
% uMeanAbd(uTEoutGoing <= 0) = [];uTEoutGoing(uTEoutGoing <= 0) = [];
% figure;
h_fit = powerlawfit(hMeanAbd,hTEoutGoing,'bo');hold on
t_fit = powerlawfit(tMeanAbd,tTEoutGoing,'g*');hold on
u_fit = powerlawfit(uMeanAbd,uTEoutGoing,'r+');hold off
% xlabel('Abundance');ylabel('sign(OTE)*log_1_0(|OTE|+1)');
xlabel('Abundance');ylabel('100+OTE');
% legend('Healthy','Transitory','Unhealthy');
legend('Healthy',['\gamma_H = ',num2str(h_fit)],'Transitory',['\gamma_T = ',num2str(t_fit)],'Unhealthy',['\gamma_U = ',num2str(u_fit)])
set(gca,'FontSize',28)