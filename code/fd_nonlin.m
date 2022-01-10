function [F] = fd_nonlin(u,N)
% Eingabe:
%   u Vektor u der Groeße (N + 1)
%   N Anzahl von Teilintervallen N.
% Ausgabe:
%   F Vektor F(u) der Groeße (N + 1) 
D=0.003;
h=1;
Sl=10;
Sr=10e5;
k=11e6;
k2=10e-8;
u0=u(1);
u1=u(2);
un=u(N);

F(1)=2*D/h^2*u1-((Sl*2*h+2*D+k*h^2)/(h^2))*u0-k2*u0^2;
F(N+1)=-(2*D+k*h^2+Sr*2*h)/(h^2)*un+2*(D)/(h^2)*u(N-1)-k2*un^2;
for i=2:N
    F(i)=D/h^2*u(i+1)-(2*D+k*h^2)/(h^2)*u(i)+D/h^2*u(i-1)-k2*u(i)^2;
end
end

