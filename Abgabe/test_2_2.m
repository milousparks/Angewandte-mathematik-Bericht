N=19;
tol=10^-3;
nmax=1000;
[z,u]=stationaer_nonlin(@(z) 1+0*z,N,tol,nmax);
plot(z,u,'b-',z,u,'r*',LineWidth=4)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
%%
c=konstanten;
N=100;
S0=[10^2 10^3 10^4]; %1/um^3us
[z,u]=stationaer_nonlin(@(z) S0(1)*exp(-c.a*z),N,tol,nmax);
plot(z,u,'b-',z,u,'r*',LineWidth=1)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
%y(1:2:end)
%%
s=@(z) S0(2)*exp(-c.a*z);
tol=10^-8;
nmax=100;
for N=2:2:10000

    [z1,u1] = stationaer_nonlin(s,N,tol,nmax);
    [z2,u2] = stationaer_nonlin(s,N*2,tol,nmax);

    %|F1-F2|/|(Beste Naeherung)|
    d_u_rel = abs(u1-u2(1:2:end)) ./ abs(u2(1:2:end));
    [rel_F,I] = max(d_u_rel);               % max Fehler suchen
    max_rel_F=0.001;

    if rel_F < max_rel_F %Bis Fehler kleiner max Fehler
        break;
    end

end
plot(z1,u1,'b-',z2,u2,'r*',LineWidth=1)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
