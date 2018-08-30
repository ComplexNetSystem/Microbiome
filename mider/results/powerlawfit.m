function fit_K = powerlawfit(abd,te,string)

a=polyfit(log(abd),log(te'),1);
fit_K = a(1);
x = min(abd) : 1e-3 :1;
b = 2.71828 ^ a(2);
y = b * x.^a(1);
% semilogx(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
loglog(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',2);