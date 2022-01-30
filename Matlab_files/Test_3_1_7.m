close all
N = 1e+3;
y_a =[2;1];
t_span = [0,2];
tol = 10e-6;
N_max=100;

fun = @(t,y) [-3*t*y(1)-2*y(2);y(1)+t.^2*y(2)];

syms y1 y2 t

% syms: Erzeugt symbolische skalare Variablen var1 ... varN vom Typ sym. 
% Verschiedene Variablen sind durch Leerzeichen zu trennen.

j_fun = @(t,y) [-3*t,-2;1,2*t.^2];

[t_fun_euler,y_fun_euler] = impl_euler(fun,t_span,y_a,N,j_fun,tol,N_max);
[t_fun_trapez,y_fun_trapez] = impl_trapez(fun,t_span,y_a,N,j_fun,tol,N_max);

figure
plot(t_fun_euler,y_fun_euler); 
title("Die Gleichung mit dem impl. Euler-Verfahren")
xlabel("t");
ylabel("y");
set(gca,'FontSize',25)
grid on

figure
plot(t_fun_trapez,y_fun_trapez); 
title("Die Gleichung mit dem impl. Trapez-Verfahren")
xlabel("t");
ylabel("y");
set(gca,'FontSize',25)
grid on