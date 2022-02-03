% J=f_chem_jac(t,y)
%-----------------------------------------
% Eingabe:
% t Zeit t
% y Vektor y der Größe 3 x 1
%-----------------------------------------
% Ausgabe:
% J Matrix Dyfchem(t; y) der Größe 3 x 3

function J = f_chem_jac(t, y)
    a = 0.04;
    b = 10^4;
    c = 10^7;

    J(1,1) = -a;
    J(1,2) =  b*y(3); 
    J(1,3) =  b*y(2);
    
    J(2,1) =  a;
    J(2,2) = -b*y(3) - 6*c*y(2);
    J(2,3) = -b*y(2);
    
    J(3,1) =  0;
    J(3,2) =  6*c*y(2);
    J(3,3) =  0;
end