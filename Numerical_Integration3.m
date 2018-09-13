% ����̷�
% 2014013364
% ������Ű��а�
% �����

clc;
clear all;
integ = 0;
T = pi;
w = (2 * pi)/ T;
m = 3; n = 2;
j = (-1)^(1/2);
r = linspace(0, T, 1000000);
g = abs(r(2) - r(1));
for i = 1:length(r)
    x = r(i);
    f = exp(j*(m-n)*w*x);
    integ = integ + (f*g);
end

disp(abs(integ))