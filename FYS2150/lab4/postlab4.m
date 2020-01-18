% postlab til kraft og masse
vekt_kg = [0;1.500;1.6;1.6100;2;2.001;2.010;2.011;2.1;2.101];
utslag_mm = [8.05;2.69;2.38;2.33;0.97;0.96;0.92;0.91;0.62;0.61]-8.05;
%figure()
%plot(vekt_kg,utslag_mm,'.')
%xlabel('Masse [kg]')
%ylabel('Utslag [mm]')

n = length(vekt_kg);
%variasjon = std(utslag_mm);

% Balanseprinsippet
vekt_faktisk = [1;10;100;500;1000;1500;2000;2001;2010;2100]*10^-3
avlest_vekt = [1.05;10;99.8;500;999.7;1502;2002;2002.8;2011.4;2101.6]*10^-3
%figure()
%plot(vekt_faktisk,avlest_vekt,'.')
%xlabel('Masse [kg]')
%ylabel('Avlest masse [kg]')

% wheatstonebridge
spenning = ([0.08;0.033;0.102;0.222;0.240;0.801;0.951;1.510;1.640;2.170;2.307;2.820;2.952;3.480;2.844;2.980;2.980]-0.08)*10^(-3)
masse = [0;1;10;100;110;500;600;1000;1100;1500;1600;2000;2100;2500;2010;2110;2111]*(10^(-3))

%figure()
%plot(masse,spenning,'.')
%xlabel('Vekt [kg]')
%ylabel('Spenning [V]')


% Beregning av usikkerheter
% usikkerhet i stigningstallet -> usikkerhet i nøyaktighet
balanse1 = least_squares(vekt_faktisk,avlest_vekt)
wheatstone1 = least_squares(masse,spenning)
elastisk1 = least_squares(vekt_kg,utslag_mm)

% Fra databladene (nøyaktighet)

% måleur
noyaktighet_mm = 0.001;
% 5 gram systematisk usikkerhet når man legger til delta m = 1 gram


% wheatstone-bro (resistanser)
noyaktighet_ohm =  0.3;

% Fluke45 (Må ta gjennomsnitt av usikkerheter for hver måling)
v_acc = mean(spenning)*0.025*100 + 6 % mV (Nøyaktighetsfeil 6 sifre)
v_pres = 0.004 % mV 

% Stoppeklokke -> ser bort fra. 

% usikkerhet i presisjon (Avlesning)

dtau = 1/100  % fra stmean oscillasjon

presisjon_mm = 0.01
presisjon_balanse = 0.001

% summen av usikkherheten for å finne standardavvik i verdien fra modellen
% elastisk deformasjon
avvik_sum1 = sqrt(presisjon_mm^2 + noyaktighet_mm^2 + elastisk1(2)^2)
avvik_sum2 = sqrt(balanse1(2)^2 + presisjon_balanse^2)
avvik_sum3 = sqrt(wheatstone1(2)^2 + v_acc^2 + v_pres^2)

% skal finne feilen i alfa
function values = least_squares(x,y)
n = length(x);
D = sum(x.^2) - 1/n*(sum(x))^2;
E = sum(x.*y)-1/n.*sum(x)*sum(y);
F = sum(y.^2)-1/n*(sum(y)^2);
alfa = E/D;
delta_alfa = sqrt(1/(n-2)*(D*F - E^2)/D^2);
values = [alfa,delta_alfa]
end




