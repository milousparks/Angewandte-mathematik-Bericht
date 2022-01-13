function [F,J] = F_euler(z, ti, h, yi, f, df)
% Eingabe:
% z Vektor z der Größe k x 1
% ti Zeitpunkt ti
% h Schrittweite h
% yi Vektor y(i) der Größe k x 1
% f Funktionshandle für f (t; y)
% df Funktionshandle f¨ur Dyf(t; y)

% Ausgabe:
% F Vektor Feuler(z) bzw. Ftrapez(z) der Gr¨oße k x 1
% J Jacobi-Matrix DFeuler(z) bzw. DFtrapez(z) der Gr¨oße k x k als sparse matrix.

F=z-h*f(ti+h,yi+z);

J=speye(length(z))-h*df(ti+h,yi+z);
end

