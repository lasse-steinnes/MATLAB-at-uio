% t1
R = (200^2)*(1000^2*1/(3600)^2)/(0.1*9.81);
T = ((pi/2)*R)/((200)*1000/(3600));

% t2
%a
v_kmt = 2*pi*6378/24
v_ms = v_kmt/3.6

%b
a = (v_ms^2)/(6378*1000)
a_skalert = 1/a
a_gforhold = 9.81*a_skalert

%t3
%r = sin(pi/6)*4 % trengs ikke
%z = 4*cos(pi/6)
%G = 5
%theta = atan(3.46/5) % Nope 
%L1 = G/atan(theta)
%omega = sqrt(9.81/(4*cos(pi/6)))
%omega2 = sqrt(9.81/(L1*cos(theta)))
%omega3 = sqrt(9.81/(5*cos(pi/6))) Her tenkte jeg feil
omega = sqrt(9.81/(tan(pi/3)*5))


%g1
%a 
omega = sqrt(9.81/50);
omdreining_min = omega*60/(2*pi);
% b)
a_hode = 48*omega^2;
a_bein = 50*omega^2;

%g2
r = sqrt((2.5^2) + (2^2));
%vinkel =180*theta/pi
theta = acos(3.2/2.5);

M = [0 9 9; 0 3 3;1 1 1]
M_inv = inv(M)



