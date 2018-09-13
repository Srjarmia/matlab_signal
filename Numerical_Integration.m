clc;
clear all;
integ = 0;
r = linspace(0, 1, 1000000);
g = abs(r(2) - r(1));
for i = 1:length(r)
    x = r(i);
    f = x^2;
    integ = integ + (f*g);
end

disp(integ)
