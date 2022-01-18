f=@(t,y) [y(2);y(1)*y(2)*t];
n=1000;
ya=[3; 2];
tspan=[0 1];

[t,y]=loeseE_sys(f,tspan,ya,n);
plot(t,y)
grid on;

%%
[tm,ym]=loeseM_sys(f,tspan,ya,n);
hold
plot(tm,ym)
grid on;
%%
%Vergelich
yd=ym-y;
plot(t,yd);
legend();
grid on 
%%
%SIR
i0=1e-6;

y0=[0.7-i0;i0;0.3];

n=1000;
tspan=[0 1000];
[t,y]=loeseE_sys(@sir,tspan,y0,n);
plot(t,y)
grid on
legend("Gesunde","Infizierte", "Resistente")
sumy=1-sum(y,2);
figure
plot(t,sumy)
grid on

%%
