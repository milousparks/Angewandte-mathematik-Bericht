function [t,y]=impl_euler(f,tspan,ya,n,df,tol,nmax)
% Eingabe:
% f Funktionshandle für f (t; y)
% tspan Intervall [a; b]
% ya Anfangswert ya
% n Anzahl von Teilintervallen.
% df Funktionshandle für Dyf (t; y) bezüglich y
% tol Toleranz für Newton-Verfahren
% nmax maximale Anzahl an Schritten des Newton-Verfahrens
% Ausgabe:
% t Vektor der St¨utzpunkte (t0; t1; : : : ; tn) der Größe (n + 1) x 1
% y Matrix der approximierten Lösungswerte y(i) mit i = 0; : : : ; n der Gr¨oße (n + 1) x k
k=length(ya);
h=(tspan(2)-tspan(1))/n;
t=zeros(n+1,1);
y=zeros(n+1,k);
y(1,:)=ya;
t(1)=tspan(1);
x0=zeros(k,1);
for i=1:n
    t(i+1)=tspan(1)+h*i;
    
   % euler= @(z)F_euler(z,t(i),h,y(i),f,df); 
     z=newton(@(z)F_euler(z,t(i),h,y(i,:)',f,df),x0,tol,nmax);
    y(i+1,:)=y(i,:)+z';
end

