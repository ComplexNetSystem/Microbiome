clear all
load hDeDist;load tDeDist;load uDeDist;
% hDegree;   tDegree;   uDegree
% hDistance; tDistance; uDistance

figure;
[hDegreeAxis,hDePdenf] = plpdf_Parameter1(hDegree,4,'b','o'); hold on % title('Histogram For \alpha Diversity Over Days (Healthy)')
[tDegreeAxis,tDePdenf] = plpdf_Parameter1(tDegree,6,[0,185/255,0],'o'); % title('Histogram For \alpha Diversity Over Days (Transitory)')
[pDegreeAxis,pDePdenf] = plpdf_Parameter1(uDegree,10,'r','o'); hold off
legend('Healthy','pdf(Degree_H)','Transitory','pdf(Degree_T)','Unhealthy','pdf(Degree_U)');

figure;
[hDistAxis,hDistPdenf] = plpdf_Parameter1(hDistance,0.1,'b','o'); hold on % title('Histogram For \alpha Diversity Over Days (Healthy)')
[tDistAxis,tDistPdenf] = plpdf_Parameter1(tDistance,0.1,[0,185/255,0],'o'); % title('Histogram For \alpha Diversity Over Days (Transitory)')
[pDistAxis,pDistPdenf] = plpdf_Parameter1(uDistance,0.1,'r','o'); hold off
legend('Healthy','pdf(Distance_H)','Transitory','pdf(Distance_T)','Unhealthy','pdf(Distance_U)');