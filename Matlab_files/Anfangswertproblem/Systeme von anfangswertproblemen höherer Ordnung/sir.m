function [dy] = sir(~,y)
%SIR Summary of this function goes here
%   Detailed explanation goes here
c=2/5;
w=0.1;
s=y(1);
i=y(2);

ds=-c*i*s;
di=c*i*s-w*i;
dr=w*i;
dy=[ds;di; dr];

end

