N=20:5:60;
[z,u]=stationaer_lin(@(z) 1+0*z,N);
plot(z,u,'b-',z,u,'r*',LineWidth=4)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
%%
c=konstanten;
N=20:5:60;
max_rel_F = 0.001;
rel_F = 1;
S0=[10^2 10^3 10^4]; %1/um^3us
[z,u]=stationaer_lin(@(z) S0(1)*exp(-c.a*z),N);
while rel_F > max_rel_F %Bis Fehler kleiner max Fehler

N = N+1;
[z_N,u_N] = stationaer_lin_1_6(s, N);              %u(z) mit N
[z_N2,u_N2] = stationaer_lin_1_6(s, N + 0.05*N);   %u(z) mit N + 0.05*N % Frage

%|F1-F2|/|(Beste Naeherung)|
d_u_rel = abs(u_N-u_N2(1:2:end)) ./ abs(u_N2(1:2:end));
rel_F = max(d_u_rel);               %nur Maximalen Fehler betrachten
F_lin(N) = rel_F;                   %Fehler fuer Plot zwischenspeichern

end
plot(z,u,'b-',z,u,'r*',LineWidth=1)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)