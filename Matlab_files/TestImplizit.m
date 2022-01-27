f=@(t,y) [-y(1) ; -20*y(2)];
%f=@(t,y) [-y(1) ;-20*y(2)];
tspan=[0 1];
ya=[1;1];
n=100;
df=@(t,y) [-1 0 ; 0 -20];
tol=1e-12;
nmax=10;
[t1,y1]=impl_euler(f,tspan,ya,n,df,tol,nmax);
[t2,y2]=impl_trapez(f,tspan,ya,n,df,tol,nmax);
plot(t1,y1,t2,y2)
grid on;