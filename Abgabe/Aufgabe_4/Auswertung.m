close all;
tspan=[-0.05,0.2];
tol=1e-12;
nmax=100;
n_Ort=100;
n_Zeit=100;
c=konstanten;

S0=[10^2 10^3 10^4]; %1/um^3us

s = @(t,z) S0(3)*exp((-t^2)/(2*0.01^2))*exp(-c.a*z);
z=linspace(0,c.d,n_Ort+1)';
f=F_tu(s,n_Ort,z);
df=dF_tu(n_Ort);

ya = zeros(n_Ort+1,1);
[t,y] = impl_trapez(f,tspan,ya,n_Zeit,df,tol,nmax);
mesh(z,t,y,LineWidth=2);

title('Simulation mit dem Implizites Trapez-Verfahren')
xlabel('Halbleiterdicke in z')
ylabel('t')
zlabel('Ladungsträgerdichte')
set(gca,'FontSize',40)
[t,y]=ode23s(f,tspan,ya);
figure
mesh(z,t,y,LineWidth=2);
title('Simulation mit ODE23')
xlabel('Halbleiterdicke in z')
ylabel('t')
zlabel('Ladungsträgerdichte')