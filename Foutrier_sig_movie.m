clc;

fig = figure;
set(fig,'position',[0 0 1900 1000])

v = VideoWriter('peaks.avi');
open(v);
    
for N = 1:0.25:25
    
    subplot(2,2,1);
    
    at = (-pi:0.001:pi);
    aof = abs(at);

    p1 = plot(at,aof,'b');
    hold on

    l = length(at);
    atf = zeros(1,l);

    for i = 1:length(at)
        for n = 1:N
            sum = (2*((-1)^n-1)/(n^2*pi))*cos(n*at(i));
            atf(i) = atf(i) + sum;
        end
        atf(i) = atf(i) + (pi/2);
    end

    ah = plot(at,atf,'r--');
    grid on
    axis([-4 4 -0.2 3.5])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    ac = text(3,1,{'N=', count},'FontSize',14);
	legend([p1 ah],'Origin Signal', 'Fourier series','Location','southeast')
    

    subplot(2,2,2);

    bt = (-1:0.001:1);
    bof = bt.^2;

    p2 = plot(bt,bof,'b');
    hold on

    l = length(bt);
    btf = zeros(1,l);

    for i = 1:length(bt)
        for n = 1:N
            sum = (4*((-1)^n)/((n*pi)^2)) * cos(n*pi*bt(i));
            btf(i) = btf(i) + sum;
        end
        btf(i) = btf(i) + (1/3);
    end
    
    bh = plot(bt,btf,'r-.');
    grid on
    axis([-3 3 -0.2 1.2])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N);
    bc = text(2,1,{'N=', count},'FontSize',14);
    legend([p2 bh],'Origin Signal', 'Fourier series','Location','southeast')

    subplot(2,2,3);

    ct = (-pi:0.001:pi);
    cof = ct;

    for i = 1:length(ct)
        if (ct(i) >= -pi) && (ct(i) <= 0)
            cof(i) = 0;
        elseif (ct(i) <= pi) && (ct(i) > 0)
            cof(i) = 1;
        end
    end

    p3 = plot(ct,cof,'b');
    hold on

    l = length(ct);
    ctf = zeros(1,l);

    for i = 1:length(ct)
        for n = 1:(N*10)
            sum = ((1/(n*pi)) - ((-1)^n/(n*pi))) * sin(n*ct(i));
            ctf(i) = ctf(i) + sum;
        end
        ctf(i) = ctf(i) + 0.5;
    end
    
    ch = plot(ct,ctf,'r-.');
    grid on
    axis([-4 4 -0.2 1.2])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N*10);
    cc = text(3,0.2,{'N=', count},'FontSize',14);
    legend([p3 ch],'Origin Signal', 'Fourier series','Location','southeast')



    subplot(2,2,4);

    dt = (-1:0.001:1);
    dof = dt;

    for i = 1:length(dt)
        if (dt(i) >= -1) && (dt(i) <= 0)
            dof(i) = 2;
        end
    end

    p4 = plot(dt,dof,'b');
    hold on

    l = length(dt);
    dtf = zeros(1,l);

    for i = 1:length(dt)
        for n = 1:(N*10)
            an = ((-1)^n-1)/((n*pi)^2);
            bn = (((-1)^n)-2)/(n*pi);
            cn = (an^2 + (bn^2))^(1/2);
            r = atan2((-bn),an);
            sum = cn*cos(n*pi*dt(i)+r);
            dtf(i) = dtf(i) + sum;
        end
        dtf(i) = dtf(i) + (5/4);
    end
    
    dh = plot(dt,dtf,'r-.');
    grid on
    axis([-2 2 -0.2 2.5])
    title('trigonometric Fourier series')
    xlabel('t')
    ylabel('x(t)')
    count = num2str(N*10);
    dc = text(1.5,0.5,{'N=', count},'FontSize',14);
    legend([p4 dh], 'Origin Signal', 'Fourier series','Location','southeast')

    F = getframe(gca);
    writeVideo(v,F)
    if N < 25
        delete(ah)
        delete(bh)
        delete(ch)
        delete(dh)
        delete(ac)
        delete(bc)
        delete(cc)
        delete(dc)
    end
end

close(v)
