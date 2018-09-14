clc;

t = (-1:0.001:1);
of = t.^2;

plot(t,of,'b');
hold on

v = VideoWriter('peaks.avi');
open(v);

for N = 1:0.2:25
    l = length(t);
    tf = zeros(1,l);

    for i = 1:length(t)
        for n = 1:N
            sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*t(i));
            tf(i) = tf(i) + sum;
        end
        tf(i) = tf(i) + (1/3);
    end
    
    h = plot(t,tf,'r-.');
    grid on
    axis([-3 3 -0.2 1.2])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    c = text(2,1,{'N=', count},'FontSize',14);
    legend('Origin Signal', 'Fourier series','Location','southeast')

    F = getframe(gca);
    writeVideo(v,F)
    if N < 25
        delete(h)
        delete(c)
    end
end

close(v)

