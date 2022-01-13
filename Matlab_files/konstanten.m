function c=konstanten
c.d= 0.3; %um
c.D=0.3; % um^2/us
c.SL=0.1; %  um/us
c.SR=10^3; % um/us
c.k1=1; % us^-1
c.k2=10^-2; % um^3/us

c.ND=10^3; %1/um^3
c.k=c.k1+c.ND*c.k2; 
c.a=10^1; %um
end