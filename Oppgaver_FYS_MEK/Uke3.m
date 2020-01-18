% Oppgave 1: Litt beregningen av modulus og theta.
a = sqrt(8.66^2 + 2.3^2);
theta = acos(-2.3/a);
vinkel =180*theta/pi;

% Oppgave 2: Beregning av vektorer og posisjonsvektor
% a) 
xt1 = 1.1*0.48;
yt1 = -(9.8/2)*0.48^2;
yt1 = -(9.8/2)*0.48^2;
% c 
yt2 = -(9.8)*0.48;
v = sqrt((1.1)^2 +(-9.8*0.48)^2);
theta = asin(yt2/v);
vinkel =180*theta/pi;

% Oppgave 3
theta = acos(32/62);
T = 45*9.81/sin(theta);
N = 45*9.81/tan(theta);
% Good, jippi! :D 

% Gruppeoppgaver
% G1. 
v1 = sqrt(100^2 + 240^2);
theta = acos(100/v1);
vinkel = 180*theta/pi;

theta = asin(100/240);
vinkel = 180*theta/pi;
vfly = sqrt((240*sin(vinkel))^2+(240*cos(vinkel))^2);
vrettfram = 100/tan(theta);
vrettfram2 = cos(theta)*vfly;
%G2
theta1 = 30*pi/180
theta2 = 53*pi/180
G1 = sin(theta1)*100*9.8
G2 = sin(theta2)*50*9.8
% So far so good,mangler bare litt nå. b)
a  = (G1-G2)/(50+100)
% Riktig

% c) Snordraget T:
T = G1 - 100*a

% Oppgave 3
% c)
t1 = 7*2/9.4;
h0 = 3.5 - 9.4*sqrt(3)/2*t1 + 9.81/2*(t1)^2;
v1t1 = 9.4/2
v2t1 = 9.4*sqrt(3)/2 - 9.81*t1





