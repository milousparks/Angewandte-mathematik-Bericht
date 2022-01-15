function J = fd_nonlin_jac(u,N)
%Eingabe:
% u Vektor u der Größe (N + 1) x 1
% N Anzahl von Teilintervallen N.
% Ausgabe:
% J Jacobi-Matrix DF(u) der Größe (N + 1) x (N + 1) als sparse matrix


J = zeros(N+1);%Pre allokieren
c = konstanten;   %Konstanten
h=c.d/N; %Schrittweite

% Matrix besetzen
for i = 2 : N
    J(i,i-1) = (c.D/h^2);
    J(i,i) =((-2*c.D- kh^2)/h^2) + 2 * u(i) * (-k2);
    J(i,i+1) =(c.D/h^2);
end

% Randbedingungen einfügen

% Linke Seite
J(1,1)=-(c.SL*2*h+2*c.D+c.k*h^2)/h^2-2*c.k2*u(1);
J(1,2)=2*c.D/h^2;

%Rechte Seite
J(N+1,N+1)=-(c.SR*2*h+2*c.D+c.k*h^2)/h^2-2*c.k2*u(N+1);
J(N+1,N)=2*c.D/h^2;

end