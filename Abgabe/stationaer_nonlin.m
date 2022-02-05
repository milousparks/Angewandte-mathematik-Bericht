function [z,u]=stationaer_nonlin(s,N,tol,nmax)
%   Eingabe:
%       s Funktionshandle auf Funktion s(z)
%       function sz=s(z) mit Spaltenvektoren z und sz
%       N Anzahl von Teilintervallen N.
%       tol Toleranz für Newton-Verfahren
%       nmax maximale Anzahl an Schritten des Newton-Verfahrens
%   Ausgabe:
%       z Knotenpunkte (z0,z1,..., zN) der

c=konstanten; % Konstanten 
z = linspace(0, c.d, N+1)'; % Knotenpunkte gleichmäßig auf Bereich verteilen
z0=ones(N+1,1); % Startvektor

function [y, dy] = f(u,N,z)
    y = fd_nonlin(u,N) +s(z);                        
    dy = fd_nonlin_jac(u,N);
end

[u, ~, ~]=newton(@(u)f(u,N,z) , z0, tol, nmax);

end
