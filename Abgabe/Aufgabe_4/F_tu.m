function f= F_tu(s,n_Ort,z)
%F_TU Summary of this function goes here
%   Detailed explanation goes here
 f  =  @(t,u)  fd_nonlin(u,n_Ort) + s(t,z);
end

