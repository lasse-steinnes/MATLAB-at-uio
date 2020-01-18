% Ukesoppgaver uke 5
%t1
v = sqrt(3*9.81)

%t2
Fx_sum = 100*cos(pi/6)-0.3*(10*9.81-100*sin(pi/6))

%t3
% Skal finne dynamisk friksjonskoeffisient
u_d = 6/20

% g1:
omega = sqrt(9.81/(0.2*3))

% g2:
% ok

% g3
%vinkel =180*theta/pi;
vinkel = 31;
r = 316;
u_s = 0.7
theta = vinkel*pi/180;
v = sqrt(r*cos(theta)*sin(theta)*9.81*(1-0.7)) %feil
v = sqrt((-u_s*sin(theta)+cos(theta))*9.81*r) % feil
v = sqrt((r*9.81*(sin(theta)+cos(theta)*u_s))/(cos(theta)-sin(theta)*u_s)) % riktig, men pass på fortegn, hvor du setter vinklene

