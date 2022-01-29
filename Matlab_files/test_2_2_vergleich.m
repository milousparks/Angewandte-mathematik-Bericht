%%
%Neuer Test
close all;
lamda=-100;
ufunc=@(z) exp(lamda*z); 
N=10;
c=konstanten;
ud=exp(lamda*c.d);
u0=exp(lamda*0);

c.SL=lamda*exp(lamda*0)*c.D/u0;
c.SR=-lamda*exp(lamda*c.d)*c.D/ud;

s=@(z) -(c.D*lamda^2-c.k)*exp(lamda*z)+c.k2*exp(2*lamda*z);
tol=10^-16;
nmax=10000;
[z,u]=stationaer_nonlin(s,N,tol,nmax);

z2=linspace(0,c.d,1000);
ufund=ufunc(z2);

plot(z2,ufund,'b-',z,u,'r*',LineWidth=4,MarkerSize=6)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
set(gca,'FontSize',45)
grid on
figure

ufund=ufunc(z);
ud=abs(ufund-u);
plot(z,ud,LineWidth=4)
xlabel("z in \mum")
ylabel("Abs Fehler")
set(gca,'FontSize',45)
grid on;