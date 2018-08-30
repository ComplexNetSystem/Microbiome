function threshold_MaxTE = threAquire_4_maxTE(dataTE,ShannonEntropy)

% TE_Norm = dataTE/max(max(abs(dataTE)));
TE_Norm = dataTE;
abs_TE_Norm = abs(TE_Norm);
threshold = [min(min(TE_Norm)):0.01:max(max(TE_Norm))];
% threshold = [0:0.01:max(max(abs_TE_Norm))];

TE_thr = zeros(1,length(threshold));
absTE_thr = zeros(1,length(threshold));
sumOfShannonEnt = sum(ShannonEntropy);
for i = 1:length(threshold)
    TE_thr(i) = sum(TE_Norm(TE_Norm >= threshold(i))) + sumOfShannonEnt;
    % TE_Threshold(i) = sum(TE_Norm(abs_TE_Norm >= threshold(i)));
    absTE_thr(i) = sum(abs_TE_Norm(abs_TE_Norm > threshold(i)));
end

figure;plot(threshold,TE_thr,'LineWidth',3,'color','r');
xlabel('Information Flow');ylabel('Network Entropy');
set(gca,'FontSize',28);xlim([-1.5 2.5]);

maxValIndex = find(TE_thr == max(TE_thr));
threshold_MaxTE = threshold(max(maxValIndex));
