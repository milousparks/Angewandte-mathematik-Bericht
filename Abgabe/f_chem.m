% dy=f_chem(t,y)
%--------------------------------------
% Eingabe:
% t Zeit t
% y Vektor y der Größe 3 x 1
%--------------------------------------
% Ausgabe:
% dy Vektor fchem(t; y) der Größe 3 x 1

function dy = f_chem(t, y)
    a = 0.04;
    b = 10^4;
    c = 10^7;
    dy(1,1) = -a*y(1) + b*y(2)*y(3);
    dy(2,1) =  a*y(1) - b*y(2)*y(3) - 3*c*y(2)^2;
    dy(3,1) =                         3*c*y(2)^2;
end