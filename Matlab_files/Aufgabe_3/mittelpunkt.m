%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit 
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       ya      Anfangswert ya
%       n       Anzahl von Teilintervalle
%   Ausgabe
%       t       Spaltenvektor der Stüzpunkte(t0,t1,...,tn)
%       y       Spaltenvektor der approximierten Lösungswerte(y0,y1,...,yn)
%               
function [t,y]=mittelpunkt(f,tspan,y0,n)
    %Schrittweite h berechnen
    a=tspan(1);
    b=tspan(2);
    h= abs(b-a)/n;
    
    %Initialisierung
    k= zeros(length(y0),2);
    y= zeros(length(y0),n+1);
    t=linspace(a,b,n+1);
    y(:,1) = y0';

    for i=1:n
        k(:,1) = f(t(i),y(:,i));
        k(:,2) = f(t(i)+h/2,y(:,i)+h/2*k(:,1));
        y(:,i+1) = y(:,i)+h*k(:,2);
    end
    t = t';
    y = y';
end