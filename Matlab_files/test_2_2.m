N=50;
tol=10^-6;
nmax=1000;
[z,u]=stationaer_nonlin(@(z) 1+0*z,N,tol,nmax);
plot(z,u,'b-',z,u,'r*',LineWidth=4)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
%%
c=konstanten;
N=50;
S0=[10^2 10^3 10^4]; %1/um^3us
[z,u]=stationaer_nonlin(@(z) S0(1)*exp(-c.a*z),N,tol,nmax);
plot(z,u,'b-',z,u,'r*',LineWidth=1)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)