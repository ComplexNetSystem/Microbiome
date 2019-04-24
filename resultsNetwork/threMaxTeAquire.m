function [threshold_MaxTE,threshold,TE_thr] = threMaxTeAquire(dataTE)

% TE_Norm = dataTE/max(max(abs(dataTE)));
TE_Norm = dataTE;
abs_TE_Norm = abs(TE_Norm);
threshold = [min(min(TE_Norm)):0.01:max(max(TE_Norm))];
% threshold = [0:0.01:max(max(abs_TE_Norm))];

TE_thr = zeros(1,length(threshold));
absTE_thr = zeros(1,length(threshold));

for i = 1:length(threshold)
    TE_thr(i) = sum(TE_Norm(TE_Norm >= threshold(i)));
    % TE_Threshold(i) = sum(TE_Norm(abs_TE_Norm >= threshold(i)));
    absTE_thr(i) = sum(abs_TE_Norm(abs_TE_Norm > threshold(i)));
end

figure;plot(threshold,TE_thr,'LineWidth',3,'color','b');
xlabel('Threshold');ylabel('Total of TEs');title('Total of TEs Over Threshold (Transitory)');
set(gca,'FontSize',28);xlim([-1.5 2.5]);

maxValIndex = find(TE_thr == max(TE_thr));
threshold_MaxTE = threshold(max(maxValIndex));
