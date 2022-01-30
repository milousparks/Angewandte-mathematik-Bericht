function[F,J] = F_trapez(z, ti, h, yi, f, df)
%Eingabe:
%z Vektor z der Größe  k × 1
%ti Zeitpunkt ti
%h Schrittweite h
%yi Vektor y
%(i) der Größe  k × 1
%f Funktionshandle für f(t, y)
%df Funktionshandle für Dyf(t, y)
%Ausgabe:
%F Vektor Feuler(z) bzw. Ftrapez(z) der Große  k × 1
%J Jacobi-Matrix DFeuler(z) bzw. DFtrapez(z) der Größe  k × k als sparse matrix.

F = z-0.5*h*(f(ti,yi)+ f(ti+h,yi+z));
J=speye(length(z))-0.5*h*(df(ti,yi)+ f(ti+h,yi+z));
end