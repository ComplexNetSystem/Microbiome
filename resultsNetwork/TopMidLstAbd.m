% Please first run sigmaOverMiu.m and check the Top 1, Intermediate 1 and
% Least 1 species.
top1 = x(:,27)';
mid1 = x(:,37)';
lst1 = x(:,31)';

% figure;[a,b] = plpdf_Parameter1(top1,0.025,'b','o',[0 0.5]);
% figure;[c,d] = plpdf_Parameter1(mid1,0.00025,'b','o',[0 0.01]);
figure;[e,f] = plpdf_Parameter1(lst1,0.0001,'b','o',[0 0.001]);

% for i = 1:length(f)

figure;eX = eprob(lst1); 
[alpha, xmin, L] = plfit(lst1);hold on
plplotModify(lst1, xmin, alpha);

xlabel('Abundance (Least 1)');ylabel('EPDF');
% title(['EPDF of Distance (Healthy MaxEnt)','(\alpha = ',num2str(alpha),')']);
set(gca,'FontSize',28);