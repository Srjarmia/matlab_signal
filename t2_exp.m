T = 2*10^(-6);
t = 0:2*10^(-9):T;
f = 10000000;
y = exp(-0.1.*f.*t).*cos(2*pi.*f.*t.*exp(-0.1.*f.*t));
plot(t,y);