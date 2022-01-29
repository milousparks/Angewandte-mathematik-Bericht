function [z,u] = stationaer_lin(s,N,c)
%   Eingabe:
%       s Funktionshandle auf Funktion s(z)
%       function sz=s(z) mit Spaltenvektoren z und sz
%       N Anzahl von Teilintervallen N.
%   Ausgabe:
%       z Knotenpunkte (z0; z1,..., zN) der Größe (N + 1) x 1
%       u Vektor u der Größe (N + 1) x 1
%c=konstanten;

h=c.d/N; %Schrittweite
z=(0:N)'*h; % Knotenpunkte

b=-s(z); % Bestimmung von b an den Knotenpunkten
A=fd_lin_matrix(N,c); % matirx berechnen
u=A\b;
 