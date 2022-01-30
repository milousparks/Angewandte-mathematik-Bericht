
close all
c=konstanten;
S0=[10^2 10^3 10^4]; %1/um^3us
s=@(z) S0(3)*exp(-c.a*z);
tol=10^-6;
nmax=100;
multi=100;
max_rel_F=10^-3;
for N=2:2:10000    [z1,u1] = stationaer_nonlin(s,N,tol,nmax);
    [z2,u2] = stationaer_nonlin(s,N*multi,tol,nmax);

    %|F1-F2|/|(Beste Naeherung)|
    d_u_rel = abs(u1-u2(1:multi:end)) ./ abs(u2(1:multi:end));
    [rel_F,I] = max(d_u_rel);               % max Fehler suchen
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

