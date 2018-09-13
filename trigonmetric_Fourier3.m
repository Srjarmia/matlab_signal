clc;
clear all;

t = (-1:0.001:1);
of = t.^2;

l = length(t);
tf = zeros(1,l);

N = 1;
for i = 1:length(t)
    for n = 1:N
        sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*t(i));
        tf(i) = tf(i) + sum;
    end
    tf(i) = tf(i) + (1/3);
end

l = length(t);
tf2 = zeros(1,l);
N = 2;
for i = 1:length(t)
    for n = 1:N
        sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*t(i));
        tf2(i) = tf2(i) + sum;
    end
    tf2(i) = tf2(i) + 0.33333;
end

l = length(t);
tf3 = zeros(1,l);
N = 3;
for i = 1:length(t)
    for n = 1:N
        sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*t(i));
        tf3(i) = tf3(i) + sum;
    end
    tf3(i) = tf3(i) + 0.33333;
end

l = length(t);
tf4 = zeros(1,l);
N = 5;
for i = 1:length(t)
    for n = 1:N
        sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*t(i));
        tf4(i) = tf4(i) + sum;
    end
    tf4(i) = tf4(i) + 0.33333;
end

fig = figure;
set(fig,'position',[50 50 1400 900])

subplot(2,2,1)

plot(t,of,'b');
hold on
plot(t,tf,'r--');

grid on
axis([-4 4 -0.2 1.2])
title('trigonometric Fourier series')
xlabel('t')
ylabel('x(t)')
legend('Origin Signal', 'Fourier series','Location','southeast')

subplot(2,2,2)

plot(t,of,'b');
hold on
plot(t,tf2,'r--');

grid on
axis([-4 4 -0.2 1.2])
title('trigonometric Fourier series')
xlabel('t')
ylabel('x(t)')
legend('Origin Signal', 'Fourier series','Location','southeast')

subplot(2,2,3)

plot(t,of,'b');
hold on
plot(t,tf3,'r--');

grid on
axis([-4 4 -0.2 1.2])
title('trigonometric Fourier series')
xlabel('t')
ylabel('x(t)')
legend('Origin Signal', 'Fourier series','Location','southeast')

subplot(2,2,4)

plot(t,of,'b');
hold on
plot(t,tf4,'r--');

grid on
axis([-4 4 -0.2 1.2])
title('trigonometric Fourier series')
xlabel('t')
ylabel('x(t)')
legend('Origin Signal', 'Fourier series','Location','southeast')
