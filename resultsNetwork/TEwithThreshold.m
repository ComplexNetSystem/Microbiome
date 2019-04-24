clear all

load output_Healthy_A; 
[H.rawTE_thr_A,H.absTE_thr_A,H.threshold_A] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); H_TE = reshape(Output.T,1,m * n); 
H.TE_thr = H_TE; clear H_TE

load output_Healthy_B; 
[H.rawTE_thr_B,H.absTE_thr_B,H.threshold_B] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); H_TE = reshape(Output.T,1,m * n); 
H.TE_thr = [H.TE_thr,H_TE]; clear H_TE

load output_Healthy_C; 
[H.rawTE_thr_C,H.absTE_thr_C,H.threshold_C] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); H_TE = reshape(Output.T,1,m * n); 
H.TE_thr = [H.TE_thr,H_TE]; clear H_TE

load output_Healthy_C1; 
[H.rawTE_thr_C1,H.absTE_thr_C1,H.threshold_C1] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); H_TE = reshape(Output.T,1,m * n); 
H.TE_thr = [H.TE_thr,H_TE]; clear H_TE

load output_Unhealthy_D; 
[UnH.rawTE_thr_D,UnH.absTE_thr_D,UnH.threshold_D] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); P_TE = reshape(Output.T,1,m * n); 
UnH.TE_thr = P_TE; clear P_TE

load output_Unhealthy_E; 
[UnH.rawTE_thr_E,UnH.absTE_thr_E,UnH.threshold_E] = analysis_TE_Threshold(Output.T);
[m,n] = size(Output.T); P_TE = reshape(Output.T,1,m * n); 
UnH.TE_thr = [UnH.TE_thr,P_TE]; clear P_TE

All.TE_thr = [H.TE_thr,UnH.TE_thr];

clearvars -EXCEPT H and UnH and All

[H.rawTE_thr,H.absTE_thr,H.threshold] = analysis_TE_Threshold(H.TE_thr);
[UnH.rawTE_thr,UnH.absTE_thr,UnH.threshold] = analysis_TE_Threshold(UnH.TE_thr);
[All.rawTE_thr,All.absTE_thr,All.threshold] = analysis_TE_Threshold(All.TE_thr);

figure; plot(H.threshold_A,H.rawTE_thr_A,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Healthy A');set(gca,'FontSize',16)
figure; plot(H.threshold_B,H.rawTE_thr_B,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Healthy B');set(gca,'FontSize',16)
figure; plot(H.threshold_C,H.rawTE_thr_C,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Healthy C');set(gca,'FontSize',16)
figure; plot(H.threshold_C1,H.rawTE_thr_C1,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Healthy C1');set(gca,'FontSize',16)
figure; plot(UnH.threshold_D,UnH.rawTE_thr_D,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Unhealthy D');set(gca,'FontSize',16)
figure; plot(UnH.threshold_E,UnH.rawTE_thr_E,'LineWidth',3);
xlabel('Threshold (TE)');ylabel('Transfer Entropy');
title('Total of TEs for Unhealthy E');set(gca,'FontSize',16)

figure;plot(H.threshold,H.rawTE_thr/4,'LineWidth',3,'color','b');hold on
plot(UnH.threshold,UnH.rawTE_thr/2,'LineWidth',3,'color','r');
plot(All.threshold,All.rawTE_thr/6,'LineWidth',3,'color',[222/255,125/255,0]);hold off
xlabel('Threshold (TE)');ylabel('Average Transfer Entropy');title('Total of TEs for Each Group')
legend('Healthy','Unhealthy','All');set(gca,'FontSize',16);
