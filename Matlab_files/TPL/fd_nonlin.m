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
x1=u(1:N-1).*((c.D)/ h ^2 );
x2=u(2:N).*((-2*c.D)/h^2-c.k);
x3=u(3:N+1).*(c.D/h^2);
x4=u(2:N).^2*-(c.k2);
F(2:N)=x1+x2+x3+x4;


% Randwerte in Matrix einfügen
F(1)=2*c.D/h^2*u(2)-((c.SL*2*h+2*c.D+c.k*h^2)/(h^2))*u(1)-c.k2*u(1)^2;
F(N+1)=-(2*c.D+c.k*h^2+c.SR*2*h)/(h^2)*u(N+1)+2*(c.D)/(h^2)*u(N)-c.k2*u(N+1)^2;
end

