clc;

t = (-pi:0.001:pi);
of = abs(t);

plot(t,of,'b');
hold on

v = VideoWriter('peaks.avi');
open(v);

for N = 1:0.2:25 
    l = length(t);
    tf = zeros(1,l);

    for i = 1:length(t)
        for n = 1:N
            sum = (2*((-1)^n-1)/(n^2*pi))*cos(n*t(i));
            tf(i) = tf(i) + sum;
        end
        tf(i) = tf(i) + (pi/2);
    end

    h = plot(t,tf,'r--');
    grid on
    axis([-4 4 -0.2 3.5])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    c = text(3,1,{'N=', count},'FontSize',14);
	legend('Origin Signal', 'Fourier series','Location','southeast')
    
    F = getframe(gca);
    writeVideo(v,F);
    if N < 25
        delete(h)
        delete(c)
    end
end

close(v);