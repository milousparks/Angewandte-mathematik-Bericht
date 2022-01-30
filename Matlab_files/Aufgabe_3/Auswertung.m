close all
y_a =[1;0;0];
t_span = [0,1];
N_max=100;
tol=10^-8;
nmax=100;
multi=10;
max_rel_F=10^-6;
%Implizites Euler
for N=2:2:10000
    [t1,y1] = impl_euler(@f_chem ,t_span,y_a,N,@f_chem_jac,tol,N_max);
    [t2,y2] = impl_euler(@f_chem,t_span,y_a,N*2,@f_chem_jac,tol,N_max);
    %|F1-F2|/|(Beste Naeherung)|
    d_u_abs = abs(y1(:,:)-y2(1:2:end,:));
    [u_abs] = max(d_u_abs);               % max Fehler suchen
    if u_abs < max_rel_F %Bis Fehler kleiner max Fehler
        disp("Implizites Euler")
        N
        d_u_abs(N,:)
        break;
    end
end
%Implizites trapez
for N=2:2:10000
    [t1,y1] = impl_trapez(@f_chem ,t_span,y_a,N,@f_chem_jac,tol,N_max);
    [t2,y2] = impl_trapez(@f_chem,t_span,y_a,N*2,@f_chem_jac,tol,N_max);
    %|F1-F2|/|(Beste Naeherung)|
    d_u_abs = abs(y1(:,:)-y2(1:2:end,:));
    [u_abs] = max(d_u_abs);               % max Fehler suchen
    if u_abs < max_rel_F %Bis Fehler kleiner max Fehler
        disp("Implizites trapez")
        N
        d_u_abs(N,:)
        break;
    end
end
%Explizietes Euler
for N=2:2:10000
    [t1,y1] =loeseE_sys(@f_chem,t_span,y_a,N);
    [t2,y2] = loeseE_sys(@f_chem,t_span,y_a,N*2);
    %|F1-F2|/|(Beste Naeherung)|
    d_u_abs = abs(y1(:,:)-y2(1:2:end,:));
    [u_abs] = max(d_u_abs);               % max Fehler suchen
    if u_abs < max_rel_F %Bis Fehler kleiner max Fehler
        disp("Explizit Euler")
        N
        d_u_abs(N,:)
        break;
    end
end
%Mittelpunkt
for N=2:2:10000
    [t1,y1] =loeseM_sys(@f_chem,t_span,y_a,N);
    [t2,y2] = loeseM_sys(@f_chem,t_span,y_a,N*2);
    %|F1-F2|/|(Beste Naeherung)|
    d_u_abs = abs(y1(:,:)-y2(1:2:end,:));
    [u_abs] = max(d_u_abs);               % max Fehler suchen
    if u_abs < max_rel_F %Bis Fehler kleiner max Fehler
        disp("Mittelpunkt")
        N
        d_u_abs(N,:)
        break;
    end
end
