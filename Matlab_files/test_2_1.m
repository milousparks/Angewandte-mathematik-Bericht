N=20:5:60;
[z,u]=stationaer_lin(@(z) 1+0*z,N);
plot(z,u,'b-',z,u,'r*',LineWidth=4)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)
%%
c=konstanten;
N=100;
max_rel_F = 0.001;
rel_F = 1;
S0=[10^2 10^3 10^4]; %1/um^3us
s=@(z) S0(1)*exp(-c.a*z);
[z,u]=stationaer_lin(s,N);
%%
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
plot(z1,u1,'b-',z2,u2,'r*',LineWidth=1)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
grid on
set(gca,'FontSize',40)

%%
%Neuer Testf
u0=1;
ud=0.741;
lamda=-1;
ufunc=@(z) exp(lamda.*z); 
N=10;
c=konstanten;

SL=lamda*exp(0)*c.D/u0;
SR=-lamda*exp(lamda*c.d)*c.D/ud;

s=@(z) -(c.D*lamda^2-c.k)*exp(lamda*z);


[z,u]=stationaer_lin(s,N);
z2=linspace(0,0.3,1000);
ufund=ufunc(z2);

plot(z,u,'r*',z2,ufund,'b-',LineWidth=2)
ylabel("u(z) in \mum^3")
xlabel("z in \mum")
set(gca,'FontSize',40)
grid on
figure

ufund=ufunc(z);
ud=abs(ufund-u);
plot(z,ud)
set(gca,'FontSize',40)
