% prelab gamma

% 2,3: Skal benytte poisson mat til å beregne m, middelverdi, og s
m = mean(data);
s = std(data);

% 4 effektivitet til GM-teller
A = 10^6;  % Bequerel (s^-1)
r = 2e-2; % m, radius på sirkulært vindu
d = 20e-2; % m, avstand til kilden fra vinduet
nb = 2; % 1/s, bakgrunnstråling
nr = 23; % 1/s, antall kvanter som registreres
omega = (pi*r^2)/d^2; %romvinkelen

eff = (nr - nb)/(A*omega/(4*pi))*100

% oppgave 5
skjerming = [0;4;8;12;16;20;24]*10^(-3); %m
tellerate_n = [13.7;12.4;11.0;9.7; 8.9; 7.9;7.1]; %1/s
ln_I = log(tellerate_n)


% regner med at man skal bestemme stigningstall og feil i denne 
least_squares(skjerming,ln_I)

%finne FWHM
figure()
n = linspace(0,length(spektrum),length(spektrum));
plot(n,spektrum)
ylabel('tellinger/kanal')
xlabel('Kanal')
hold on 

%bakgrunn
x = linspace(641.6,1001,100);
y0 = 32.42/(1001-641.6)*1001
y = y0-32.42/(1001-641.6)*x;
plot(x,y)

% Må finne indexene, toppen om halve toppen, bredden herfra
index1 = find(n == 6.416265884652981e+02)
index2 = find(n == 1.000977517106549e+03)

%spek2 = spektrum(index1:index2)

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
