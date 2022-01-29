close all
S0=[10^2 10^3 10^4]; %1/um^3us
s=@(z) S0(3)*exp(-c.a*z);

c=konstanten;
max_rel_F=0.001;
for N=2:2:10000
  
[z1,u1] = stationaer_lin(s, N);             
[z2,u2] = stationaer_lin(s, N*2);   

%|F1-F2|/|(Beste Naeherung)|
d_u_rel = abs(u1-u2(1:2:end)) ./ abs(u2(1:2:end));
[rel_F,I] = max(d_u_rel);               % max Fehler suchen

if rel_F < max_rel_F %Bis Fehler kleiner max Fehler
     break;
end

end
plot(z1,u1,'b-',z2,u2,'r*',LineWidth=4,MarkerSize=6)
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

