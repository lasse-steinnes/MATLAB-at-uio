% oppgaver til prelab4: Kraft og masse

vekt_kg = e00;
utslag_mm = e1;
n = length(vekt_kg);

% skal finne feilen i alfa
D = sum(vekt_kg.^2) - 1/n*(sum(vekt_kg))^2;
E = sum(vekt_kg.*utslag_mm)-1/n.*sum(vekt_kg)*sum(utslag_mm)
F = sum(utslag_mm.^2)-1/n*(sum(utslag_mm)^2);
alfa = E/D
delta_alfa = sqrt(1/(n-2)*(D*F - E^2)/D^2)


%  svingetid i sekunder
tau = [4.12, 4.04, 4.16, 4.02, 4.03, 4.04, 3.89, 4.2, 4.12, 4.05];
m = 2; %kg
% tau  = 2*pi*sqrt(m/k)
tau_hat = mean(tau);
k = m*(2*pi./tau).^2;
k_hat = mean(k)

% skal finne delta tau og så delta m
sm_tau = std(tau)/sqrt(length(tau));
sm_k = std(k)/sqrt(length(k))

sm_kg = 2*m*(sm_tau/tau_hat)
sm_kg2 = sm_tau/(2*pi)*k_hat

% sensitivitet i prosent
avstand = 22.416; % meter
s_utstyr = 2e-3;
prosent = s_utstyr/avstand;

% husk i mm
sens2 = (20.712e3)*0.05/100;
sensitivitet = (2 + sens2);

