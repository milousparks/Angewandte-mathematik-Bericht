close all
c=konstanten;
S0=[10^2 10^3 10^4]; %1/um^3us
s=@(z) S0(3)*exp(-c.a*z);


max_rel_F=10^-3;
multi=2;
for N=10:2:10000
 
[z1,u1] = stationaer_lin(s, N);             
[z2,u2] = stationaer_lin(s, N*multi);   

%|F1-F2|/|(Beste Naeherung)|
d_u_rel = abs(u1-u2(1:multi:end)) ./ abs(u2(1:multi:end));
rel_F = max(d_u_rel);               % max Fehler suchen
%maxerr(i) = norm((u1-u2s)./u2s,inf);
if rel_F < max_rel_F %Bis Fehler kleiner max Fehler
     break;
end

end
plot(z2,u2,'b-',z1,u1,'o',LineWidth=4,MarkerSize=10)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',45)

figure
plot(z1,d_u_rel,LineWidth=4)
grid on
set(gca,'FontSize',45)
xlabel("z in \mum")
ylabel("Abs Fehler in z")
figure
%plot(2:2:N,rel_F(1:2:N))
