clc;
clear all;

t = (-pi:0.001:pi);
of = t;

for i = 1:length(t)
    if (t(i) >= -pi) && (t(i) <= 0)
        of(i) = 0;
    elseif (t(i) <= pi) && (t(i) > 0)
        of(i) = 1;
    end
end

l = length(t);
tf = zeros(1,l);
N = 20;
for i = 1:length(t)
    for n = 1:N
        sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*t(i));
        tf(i) = tf(i) + sum;
    end
    tf(i) = tf(i) + 0.5;
end

l = length(t);
tf2 = zeros(1,l);
N = 50;
for i = 1:length(t)
    for n = 1:N
        sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*t(i));
        tf2(i) = tf2(i) + sum;
    end
    tf2(i) = tf2(i) + 0.5;
end

l = length(t);
tf3 = zeros(1,l);
N = 100;
for i = 1:length(t)
    for n = 1:N
        sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*t(i));
        tf3(i) = tf3(i) + sum;
    end
    tf3(i) = tf3(i) + 0.5;
end

l = length(t);
tf4 = zeros(1,l);
N = 5000;
for i = 1:length(t)
    for n = 1:N
        sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*t(i));
        tf4(i) = tf4(i) + sum;
    end
    tf4(i) = tf4(i) + 0.5;
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
