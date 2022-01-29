function [F] = fd_lin_matrix(N,c)
% Eingabe:
% N Anzahl von Teilintervallen N.
% Ausgabe:
% A Finite Differenzen Matrix für u der Größe (N + 1) x (N + 1) als sparse matrix.

%c=konstanten; % Lade Konstanten 

h=c.d/N;% Schrittgröße
% Matrix besetzen
A=ones(N+1,3).*[c.D/h^2 -(2*c.D+c.k*h^2)/(h^2) c.D/h^2] ;
F=spdiags(A, [-1, 0, 1], N+1, N+1);
% Randwerte in Matrix einfügen
F(1,1)=-(2*h*c.SL+2*c.D+c.k*h^2)/h^2;
F(1,2)=2*c.D/h^2;
F(N+1,N+1)=-(2*h*c.SR+2*c.D+c.k*h^2)/(h^2);
F(N+1,N)=2*c.D/h^2;
end

