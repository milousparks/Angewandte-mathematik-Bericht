function [t,y]=loeseE_sys(f,tspan,ya,n)
k=length(ya);
h=(tspan(2)-tspan(1))/n;
t=zeros(n+1,1);
y=zeros(n+1,k);
y(1,:)=ya;
t(1)=tspan(1);
for i=1:n
    t(i+1)=tspan(1)+h*i;
    y(i+1,:)=y(i,:)+h*f(t(i),y(i,:)')';
end
