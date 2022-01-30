% Eingabe:
%   u       Vector u der Größe (N+1)x 1
%   t      
%   
% Ausgabe
%   F       Vektor F(u) der Größe (N+1)x 1.
%
function F=fd_4(t,u)


%Parameter
d = 0.3;   % um
D = 0.3;   % um^2/us
k1 = 1.0;  % 1/us
k2 = 0.01; % um/us 
ND = 1000; % 1/um^3
SL = 0.1;  % um/us
SR = 1000; % um/us
alpha = 10; %1/µm

global s0
sz=@(t,z) s0 .* exp(-t.^2/(2.*0.01.^2)).*exp(-alpha.*z);

k = (k1 + (k2 * ND));
N=length(u)-1;
    h = d/N;
    z=(0:h:d)';
    
%   Leere Matrix F erstellen
    F = zeros(N+1,1);
    
    %erstellen der Zeilenvektoren
    vec_row_0 = u(1)*(-2*D/h.^2 - 2*SL/h - k - k2*u(1)) + u(2)*(2*D/h.^2)+ sz(t,z(1));
    vec_row_N_plus_1 = u(N+1)*(-2*SR/h - 2*D/h - k- k2*u(N+1)) + u(N)*(2*D/h.^2)+ sz(t,z(N+1));
    
    F(1)= vec_row_0;
    F(N+1)= vec_row_N_plus_1;
    
    for i=2:N
        F(i)= D*(u(i+1)-2*u(i)+u(i-1))/h.^2-k*u(i)-k2*u(i).^2+sz(t,z(i));
    end
   
end