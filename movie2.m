clc;

t = (-pi:0.001:pi);
of = t;

for i = 1:length(t)
    if (t(i) >= -pi) && (t(i) <= 0)
        of(i) = 0;
    elseif (t(i) <= pi) && (t(i) > 0)
        of(i) = 1;
    end
end

fig = figure;
set(fig,'position',[100 100 700 350])

plot(t,of,'b');
hold on

v = VideoWriter('peaks.avi');
open(v);

for N = 1:2:250
    l = length(t);
    tf = zeros(1,l);

    for i = 1:length(t)
        for n = 1:N
            sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*t(i));
            tf(i) = tf(i) + sum;
        end
        tf(i) = tf(i) + 0.5;
    end
    
    h = plot(t,tf,'r-.');
    grid on
    axis([-4 4 -0.2 1.2])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    c = text(3,0.2,{'N=', count},'FontSize',14);
    legend('Origin Signal', 'Fourier series','Location','southeast')

    F = getframe(gca);
    writeVideo(v,F)
    if N < 5000
        delete(h)
        delete(c)
    end
end

close(v)

