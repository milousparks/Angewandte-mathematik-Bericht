function [F] = fd_nonlin(u,N)
% Eingabe:
%   u Vektor u der Groeße (N + 1)
%   N Anzahl von Teilintervallen N.
% Ausgabe:
%   F Vektor F(u) der Groeße (N + 1) 
c=konstanten; % Lade Konstanten 

% Konstanten Zuweisen
D=c.D; 
Sl=c.Sl;
Sr=c.Sr;
k=c.k;
k2=c.k2;

% u für Randbedigungen
u0=u(1);
u1=u(2);
un=u(N);


h=1;% Schrittgröße

%Randwerte in Matrix einfügen
F(1)=2*D/h^2*u1-((Sl*2*h+2*D+k*h^2)/(h^2))*u0-k2*u0^2;
F(N+1)=-(2*D+k*h^2+Sr*2*h)/(h^2)*un+2*(D)/(h^2)*u(N-1)-k2*un^2;

%Restliche Matrix besetzen
for i=2:N
    F(i)=D/h^2*u(i+1)-(2*D+k*h^2)/(h^2)*u(i)+D/h^2*u(i-1)-k2*u(i)^2;
end
end

