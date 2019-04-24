clear all
load StructralDegree

%%-----------PDF 4 Structural (Functional) Degree-----------%%
[a,b] = plpdf_Parameter1(hStrDegree,3,'b','o');hold on;
[c,d] = plpdf_Parameter1(tStrDegree,6,[0 185/255 0],'o');
[e,f] = plpdf_Parameter1(uStrDegree,2,'r','o');hold off
legend('Healthy','pdf(StrDegree_H)','Transitory','pdf(StrDegree_T)','Unhealthy','pdf(StrDegree_U)')

%%----------EPDF 4 Structural (Functional) Degree-----------%%
figure;eX = eprob(hStrDegree'); 
[alpha, xmin, L] = plfit(hStrDegree');hold on
H_H = plplotModify(hStrDegree',xmin, alpha);hold on
eX = eprob(tStrDegree'); 
[alpha, xmin, L] = plfit(tStrDegree');hold on
H_T = plplotModify(tStrDegree',xmin, alpha);hold on 
eX = eprob(uStrDegree'); 
[alpha, xmin, L] = plfit(uStrDegree');hold on
H_U = plplotModify(uStrDegree',xmin, alpha);hold on
xlim([10 1000]);xlabel('Structural Degree');ylabel('EPDF');% title(['EPDF of Distance (Healthy MaxEnt)','(\alpha = ',num2str(alpha),')']);
set(gca,'FontSize',28);
hold off


[h_x_degree,h_alpha_degree,h_beta_degree] = array_alpha_beta(hStrDegree);
[t_x_degree,t_alpha_degree,t_beta_degree] = array_alpha_beta(tStrDegree);
[u_x_degree,u_alpha_degree,u_beta_degree] = array_alpha_beta(uStrDegree);

figure;
scatter(h_x_degree,h_alpha_degree,60,'b','filled'); hold on
scatter(t_x_degree,t_alpha_degree,60,[0 185/255 0],'filled');
scatter(u_x_degree,u_alpha_degree,60,'r','filled'); hold off
xlabel('Degree');ylabel('\alpha Diversity');axis tight;ylim([0,20]);set(gca,'FontSize',28);
legend('Healthy','Transitory','Unhealthy')

