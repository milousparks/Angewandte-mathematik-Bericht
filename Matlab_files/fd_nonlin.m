function [F] = fd_nonlin(u,N)
% Eingabe:
%   u Vektor u der Groeße (N + 1)
%   N Anzahl von Teilintervallen N.
% Ausgabe:
%   F Vektor F(u) der Groeße (N + 1) 

F = zeros([N+1 1]);
c=konstanten; % Lade Konstanten 

h=c.d/N;% Schrittgröße
% Matrix besetzen
for i=2 : N
   F(i,1) = u(i-1)*((c.D)/ h ^2 ) + u(i)*((-2*c.D)/h^2-c.k) + u(i+1)*(c.D/h^2)+u(i)^2*(-c.k2);
end
%F=ones(N+1,3).*(c.D/h^2*u-(2*c.D+c.k*h^2)/(h^2)*u+c.D/h^2*u-c.k2*u^2);
% Randwerte in Matrix einfügen
F(1)=2*c.D/h^2*u(1)-((c.SL*2*h+2*c.D+c.k*h^2)/(h^2))*u(0)-c.k2*u(0)^2;
F(N+1)=-(2*c.D+c.k*h^2+c.SR*2*h)/(h^2)*u(N)+2*(c.D)/(h^2)*u(N-1)-k2*u(N)^2;
end

