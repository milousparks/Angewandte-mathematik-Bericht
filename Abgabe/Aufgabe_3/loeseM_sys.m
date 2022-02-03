function [t,y]=loeseM_sys(f,tspan,ya,n)
%LOESERR Summary of this function goes here
%   Detailed explanation goes here
l=length(ya);
h=(tspan(2)-tspan(1))/n;
t=zeros(n+1,1);
y=zeros(n+1,l);
y(1,:)=ya';
t(1)=tspan(1);
for i=1:n
    k1(i,:)=f(t(i),y(i,:))';
    k2(i,:)=f(t(i)+h/2,y(i,:)+h/2*k1(i,:))';
    t(i+1)=tspan(1)+h*i;
    y(i+1,:)=y(i,:)+h*k2(i,:);
end