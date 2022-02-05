tspan=[-0.05,0.2];
tol=1e-6;
nmax=10;
nOrt=100;
nZeit=100;
ya=zeros(nOrt+1,1);
z=linspace(0,0.3,nOrt+1);
@fd_4
[t,y]=ode23s(@fd_4,tspan,ya);
mesh(z,t,y);
title('Simulation mit Ode23s')
xlabel('Halbleiterdicke in z')
ylabel('t')
zlabel('Ladungsträgerdichte')
%%
[symTrapezT,symTrapezY]=impl_trapez(@fd_4,tspan,ya,nZeit,@fd_4_jac, tol,nmax);
mesh(z,symTrapezT,symTrapezY);
title('Simulation mit dem Implizites Trapez-Verfahren')
xlabel('Halbleiterdicke in z')
ylabel('t')
zlabel('Ladungsträgerdichte')

%%
   nLocation=100;
   nTime=100;
c = konstanten;
    s0 = 10^4;
    tspan = [-0.05,0.2];
    tol = 1e-6;
    nmax = 12;

    s = @(t,z) s0*exp((-t^2)/(2*0.01^2))*exp(-c.a*z);
    z = (0:nLocation)'/ nLocation * c.d;
    f = @(t,u) fd_nonlin(u,nLocation) + s(t,z);
    df = @(t,u) fd_nonlin_jac(u,nLocation);
    ya = zeros(nLocation+1,1);
    [t,y] = impl_trapez(f,tspan,ya,nTime,df,tol,nmax);

    mesh(z,t,y)