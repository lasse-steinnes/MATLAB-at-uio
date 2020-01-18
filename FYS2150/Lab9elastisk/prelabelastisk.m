% prelab til elastisitet
m = e00 % kg
maleur = e1 % utslag[mm]

fit = least_squares(m,maleur);

% bestemme E
g = 9.81 %m/s^(2)
A = -1.393*10^(-3);
dA = 0.021*10^(-3);
l = 1.213;
dl = 0.002;
d = 14.91*10^(-3);
dd = 0.03*10^(-3);

E = 4*l^(3)*g/(3*pi*abs(A)*d^4)

sd_E = sqrt((dA/A)^2 + (4*dd/d)^2 + (3*dl/l)^2)*E

% oppgave 7
L = 1.530 %m 
M = 2.500 % kg
E = 107*10^9 % Pa
% samme diameter
% skal bestemme grunntonefrekvensen fra dette; for en stående bølge gjelder
f_hat = d/4*sqrt(pi*E/(M*L))

%oppgave 8
% fs er samplingfrekvens 44.1 kHz
[signal,sf] = audioread('messing_lyd.wav');

% Skal benytte f_hat til å lage eget lydsignal, sinus 
a = 0.2;
v = 343; %m/s
f_hat = f_hat + 1
lambda = v/f_hat;
k = 2*pi/lambda;
w = 2*pi*f_hat;
t = transpose(linspace(0,100,length(signal)));
x = transpose(linspace(0,L,length(signal)));
signal2 = a*sin(k*x - w*t);
sum_signal = signal + signal2;
sound(sum_signal);
%soundview()

% kan eventuelt benytte Fourier Transform her % se lenge, aksel lab




% skal finne feilen i alfa
function values = least_squares(x,y)
n = length(x);
D = sum(x.^2) - 1/n*(sum(x))^2;
E = sum(x.*y)-1/n.*sum(x)*sum(y);
F = sum(y.^2)-1/n*(sum(y)^2);
alfa = E/D;
delta_alfa = sqrt(1/(n-2)*(D*F - E^2)/D^2);
values = [alfa,delta_alfa];
end