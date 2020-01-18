% Oppgaver prelab til solcelle
volt = [548.58;547.26;548.31;546.47;548.0]
my = mean(volt)
avvik = std(volt)/sqrt(length(volt))

%pmax
V = [0.;0.1;0.2;0.3;0.4;0.5;0.6];
I = [-0.200;-0.195;-0.190;-0.180;-0.150;-0.080;-0.005];
P = V.*I;
pmax = max(abs(P))

% effektivitet
intensitet = 60; % w/m^2
areal = 100*(1/100)^2; % m 
mottat = intensitet*areal;
effektivitet = pmax/mottat*100
