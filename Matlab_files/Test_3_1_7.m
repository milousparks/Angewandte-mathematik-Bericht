N = 1e+3;
y_a =[2;1];
t_span = [0,2];
tol = 10e-6;
N_max=100;

fun = @(t,y)[-3t*y(1)-2y(2);y(1)+t.^2*y(2)];

syms y1 y2 t

% syms: Erzeugt symbolische skalare Variablen var1 ... varN vom Typ sym. 
% Verschiedene Variablen sind durch Leerzeichen zu trennen.

Ja_Ma_Fun = J([-3*t*y(1)-2*y(2);y(1)+t.^2*y(2)]);
j_fun = @(t,y)[-2*t,-3;2,t.^2];

[t_fun_ode,y_fun_ode] = ode45(fun,tspan,ya);
[t_fun_euler,y_fun_euler] = impl_euler(fun,tspan,ya,n,j_fun,tol,N_max);
[t_fun_trapez,y_fun_trapez] = impl_trapez(fun,tspan,ya,n,j_fun,tol,nmax);

plot(t_fun_ode,y_fun_ode); 
title("Gleichung mit ode45")
xlabel("t");
ylabel("y");

plot(t_fun_euler,y_fun_euler); 
title("Gleichung mit dem impl. Euler-Verfahren")
xlabel("t");
ylabel("y");

plot(t_fun_trapez,y_fun_trapez); 
title("Gleichung mit dem impl. Trapez-Verfahren")
xlabel("t");
ylabel("y");