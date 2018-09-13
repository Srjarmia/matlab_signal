clc;
clear all;
integ = 0;
T = 2 * pi;
w = (2 * pi)/ T;
m = 2; n = 1;
r = linspace(0, T, 1000000);
g = abs(r(2) - r(1));
for i = 1:length(r)
    x = r(i);
    f = sin(n*w*x)*cos(m*w*x);
    integ = integ + (f*g);
end

disp(integ)