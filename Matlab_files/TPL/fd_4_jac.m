function J=fd_4_jac(t,u)
%Parameter
d = 0.3;   % um
D = 0.3;   % um^2/us
k1 = 1.0;  % 1/us
k2 = 0.01; % um/us 
ND = 1000; % 1/um^3
SL = 0.1;  % um/us
SR = 1000; % um/us

k = (k1 + (k2 * ND));
N=length(u)-1;
    %h berechnen
    h = d/N;

    %erstellen der Spaltenvektoren für Bin
    avec = ones(N+1,1);
    bvec = ones(N+1,1);
    cvec =  ones(N+1,1);
    
    % i=0 (siehe[1] S.444)
    bvec(1) = -2*SL/h - 2*D/h.^2 -k -2*k2*u(1);
    cvec(2) = 2; 

    % i=N 
    avec(end-1) = 2*D/h^.2;
    bvec(end) = -2*SR/h - 2*D/h.^2 -k -2*k2*u(N+1); 
          
    %Matrix mit Standardwerten i=1 bis i=N-1 befüllen
    for i=2:N
        avec(i)= (D/h^2);
        bvec(i)= (-2*D/h.^2)-k-2*k2*u(i); 
        cvec(i)= (D/h^2);
    end
    
    %Erstellen der Jacobi-Matrix
    Bin = [avec bvec cvec];
    J = spdiags(Bin,-1:1,N+1,N+1);%Wir erstellen eine eine dünnbesetzte Matrix mit spdiags; -1:1 sagt das die erste Spalte von Bin in die Diagonale -1 kommt, die zweite in 0 usw.
end