function [x,y] = curveFit(time,alpha,string)

a=polyfit(time,alpha,4);
% fit_K = a(1);
x = time;
y = a(1)*x.^4 + a(2)*x.^3 + a(3)*x.^2 + a(4)*x +a(5);
% loglog(time,alpha',string,'LineWidth',2,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',3);