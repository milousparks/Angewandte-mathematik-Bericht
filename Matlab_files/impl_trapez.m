function[t,y]=impl_trapez(f,tspan,ya,n,df,tol,nmax)
%Eingabe:
%f Funktionshandle fur¨ f(t, y)
%tspan Intervall [a, b]
%ya Anfangswert ya
%n Anzahl von Teilintervallen.
%df Funktionshandle fur¨ Dyf(t, y) bezuglich ¨ y
%tol Toleranz fur Newton-Verfahren ¨
%nmax maximale Anzahl an Schritten des Newton-Verfahrens
%Ausgabe:
%t Vektor der Stutzpunkte ¨ (t0, t1, . . . , tn) der Große ¨ (n + 1) × 1
%y Matrix der approximierten Losungswerte ¨ y
%(i) mit i = 0, . . . , n der Große ¨ (n + 1) × k
k=length(ya);
h=(tspan(2)-tspan(1))/n;
t=zeros(n+1,1);
y=zeros(n+1,k);
y(1,:)=ya';
t(1)=tspan(1);
x0=zeros(k,1);
for i=1:n
    t(i+1)=tspan(1)+h*i;
    z = newton(@ (z)F_trapez(z, t(i),h,y(i,:)',f,df),x0,tol,nmax);
    y(i+1,:)=y(i,:)+z';
    
end