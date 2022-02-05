% Eingabe:
%--------------------------------------------
%   func    Funktionshandle für y
%   dfLoes  Lösung für die Differentialgleichung
%   N       Teilintervalle
%--------------------------------------------
%  Ausgabe:
%--------------------------------------------
%  abs_error    Maximaler absolute Fehler
%--------------------------------------------
function [absError] = max_abs_error(func,dfLoes,N)
%Aufstellen der Matrix
k = length(N);
absError = zeros(k,1);
%Suchen der maximalen absoluten Fehler für n
for i = 1:k
    [t,y] = func(N(i));
    absError(i)= max(abs(y - dfLoes(t)));
end
end