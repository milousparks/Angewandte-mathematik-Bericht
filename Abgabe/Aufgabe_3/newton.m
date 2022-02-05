% Newton-Verfahren für nichtlineare Gleichungssysteme 
%
%   [x, fval, exitflag] = newton(f, x0, tol, nmax)
%
% Beim Newton-Verfahren soll mindestens ein Schritt durchgeführt werden
% und die Iteration abgebrochen werden, falls für die k-te Iterierte x_k
%
% 	|| f(x_k) || + || x_k - x_(k-1) || < tol
%
% gilt. Hier ist ||.|| die (euklidsche) Länge eines Vektors. Rückgabewert 
% ist dann x_k ansonsten x_nmax.
%
% Eingabe:
%   f        Funktionshandle auf Funktionshandle [y,dy] = f(x)
%				Eingabe:
%					x 	Spaltenvektor der Unbekannten
%				Ausgabe:
%					y	Spaltenvektor des Funktionswertes an x
%					dy 	Jacobi-Matrix an x
% 	x0 		 Spaltenvektor des Startwerts x_0
% 	tol 	 Toleranz 
% 	nmax 	 maximale Anzahl an Iterationen bis Abbruch
%
% Ausgabe
% 	x 		 Spaltenvektor der näherungsweisen Nullstelle
% 	fval 	 Spaltenvektor des Funktionswertes an x
% 	exitflag Rückgabewert 1 falls Iteration Toleranzbedingung erfüllt hat 
%            ansonsten 0
%
function [x, fval, exitflag] = newton(f, x0, tol, nmax)
    exitflag = 0;
    xk = x0;
    for i=1:nmax
        xk_1 = xk;
        [y, dy] = f(xk_1);
        delta_x = dy \ (-y);
        xk = xk_1 + delta_x;
        fval = f(xk);
        if(norm(fval) + norm(xk - xk_1) < tol)
            exitflag = 1;
            break
        end
    end
    x = xk;
end
