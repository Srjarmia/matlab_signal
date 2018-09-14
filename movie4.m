clc;

t = (-1:0.001:1);
of = t;

for i = 1:length(t)
    if (t(i) >= -1) && (t(i) <= 0)
        of(i) = 2;
    end
end

plot(t,of,'b');
hold on

v = VideoWriter('peaks.avi');
open(v);

for N = 1:2:250
    l = length(t);
    tf = zeros(1,l);

    for i = 1:length(t)
        for n = 1:N
            an = ((-1)^n-1)/((n*pi)^2);
            bn = (((-1)^n)-2)/(n*pi);
            cn = (an^2 + (bn^2))^(1/2);
            r = atan2((-bn),an);
            sum = cn*cos(n*pi*t(i)+r);
            tf(i) = tf(i) + sum;
        end
        tf(i) = tf(i) + (5/4);
    end
    
    h = plot(t,tf,'r-.');
    grid on
    axis([-2 2 -0.2 2.5])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    c = text(1.5,0.5,{'N=', count},'FontSize',14);
    legend('Origin Signal', 'Fourier series','Location','southeast')

    F = getframe(gca);
    writeVideo(v,F)
    if N < 250
        delete(h)
        delete(c)
    end
end

close(v)

