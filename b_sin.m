pts = 100;
delta = 360/pts;
angle_deg = 0:delta:360;
angle_rad = angle_deg*pi/180;

%delta = 2*pi/pts;
%angle_rad = 0:delta:2*pi;

y = sin(angle_rad);
plot(angle_rad,y);