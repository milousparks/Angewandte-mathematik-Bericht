% Definitionen
f=@(t,y) [-y(1) ; -20*y(2)];
%f=@(t,y) [-y(1) ;-20*y(2)];
tspan=[0 1];
ya=[1;1];
n=100;
df=@(t,y) [-1 0 ; 0 -20];
tol=1e-12;
nmax=10;
[t,y]=impl_euler(f,tspan,ya,n,df,tol,nmax);
plot(t,y)
grid on;

