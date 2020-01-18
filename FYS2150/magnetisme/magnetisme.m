% Beregninger: Magnetisme 
%{
g = 9.81
force = [0.03,0.05,0.07,0.11,0.13,0.17,0.20,0.22,0.25,0.28]*g
%}
%fz = deltam*g
my0 = 4*pi*10^(-7) %T*m/A
D = [10.51;10.59;10.41;10.86]*10^(-3); % m
d = mean(D)
A = pi*(d/2)^2;
B1 = [-26.3; 99.4; 174.3; 257.6; 332.7; 407.8; 476.2; 541.9; 601.5; 655.0; 702.4;741.1;775.9]*10^(-3);
B2 = [-0.60;-0.7;-0.9;-1.3; -1.5; -1.7;-1.9; -2.0; -2.0; -2.0; -2.0; -1.9; -1.9]*10^(-3); %T
Fz = [0; 0;0; 0.2943;0.4905;0.6867;1.0791;1.275;1.667;1.962;2.158; 2.453;2.747]*10^(-3); % N


% for en diamagnet, beregner chi-verdien
chi1 = -Fz*2*my0./(A.*((B1.^2)-B2.^2));
chi2 = -Fz*2*my0./(A.*(B1.^2));
Chi = mean(chi1(3:end));
Chi2 =  mean(chi2(3:end));


% med lineær sammenheng.
chi3 = -Fz*2*my0./(A.*(B1));
Chi3 = mean(chi3(3:end))

% usikkerhet 
d_std = std(D);% usikkerhet i tverrsnittet (målt)
d_noyaktighet = 0.01*10^(-3) % m nøyaktighet til skyvelæret
% antar at feilverdien til presisjonen på vekten er neglisjerbar, og det
% samme for B-feltet(0.001 mT oppløsning)
% for et produkt blir da feilverdien:
dchi2 = sqrt((2*d_std/d)^2 + (2*d_noyaktighet/d)^2)*Chi2
dchi1 = sqrt((2*d_std/d)^2 + (2*d_noyaktighet/d)^2)*Chi

% Kan eventuelt da lage en lineærtilpasning til Fz med kvadratledd eller
% eller lineær tilpasning
% plotter for fz, og fz beregnet for kvadrat og lineært, skal finne feilen.
Fz2 = -Chi2/(2*my0)*A.*B1.^2
Fz3 = -Chi3/(2*my0)*A.*B1

figure()
plot(B1,Fz,'.-')
hold('on')
plot(B1,Fz2,'-')
hold('on')
plot(B1,Fz3,'-')
legend('Fz (målt)','Fz kvadratisk','Fz lineær')
xlabel('Magnetisk flukstetthet [T]')
ylabel('Lorentzkraft [N]')

% hvilken tilpasning som passer best: 
sum_square2 = 0
for i = 1:13  
    sum_square2 = sum_square2 + (Fz(i) - Fz2(i))^2
end

sum_square3 = 0
for i = 1:13  
    sum_square3 = sum_square3 + (Fz(i) - Fz3(i))^2
end 

% Om man ser på B2 = 0, så endres chi
d_chi = chi1(3:end).*(B2(3:end)./B1(3:end)).^2;

% ------------------------------------
% Beregninger ferromagnetisme

% teoretisk, tihørende måling med Hall-sensor.
% Beregn teoretiske verdier for kule, stang 
f_kule = 1 % (kule)
f_stav = 64.78/((10.07+10.03)/2)
f_disk = 6.96/60.1 
%f = a_paralell/a_perp
D = [D_par(f_kule); D_orto(f_kule);D_par(f_stav);D_orto(f_stav);D_par(f_disk);D_orto(f_disk)]
N = 244;
L = 275*10^(-3); 
I = 5; % Ampere % 
B0 = my0*N*I/L
FaktorB = B0./D


% bruk avmagnfaktorprogrammet her

% Beregn hysteresegreiene
kappa = 1.05*10*10^(-6); %Weber
n = 130; 
Diameter = 6.5*10^(-3); %m
A_tverr = pi*(Diameter/2)^2;
delta_S = [(77.44 + 0);(72.28 + 77.44);(22.99 +98.09);(196.18 +356.22); (273.62  + 464.64);(356.22  +526.59);(1001.55 + 0);(15.49 +1063.15);(46.46 +1104.80);(25.81 +1166.75)];

delta_B = kappa*delta_S/(n*A_tverr);
B_hysterese = delta_B/2

%skal lage plot med B(I)

% Fra teorien beregne M(H_0)
% Måler B, påtrykker H_0, dvs
% kan da bestemme M som en funksjon av H0 % feilkilde i strømmen og lengden
% L . Anta \pm 1 mm
I = [(0.89+ 0.69)/2;(1.23 + 1.03)/2;(1.71 + 1.51)/2;(2.33 + 2.12)/2;(2.88 + 2.67)/2; (3.36 +3.15)/2;(3.90+3.70)/2;(4.38 + 4.18)/2;(5.00 + 4.79)/2;(5.48+5.27)/2];
N = 344;
L = 315*10^(-3);
H0 = (N*I)/L;
B0 = my0*H0;
% fra likning 8 i min artikkel
D = 0;%||, langstrakt ellipsoide %usikkerhet ikke så viktig her?
A = (1-D)^(-1);
M = A*(B_hysterese/my0 - H0) 

figure()
plot(I,B_hysterese,'.-')
xlabel('Strøm [A]')
ylabel('Magnetisk flukstetthet [T]')

figure()
plot(H0,M,'.-')
xlabel('Påtrykt magnetfelt (H) [T]')
ylabel('Magnetisering (M) [T]')

%-------------------------------------

% Faradayeffekten
theta_rod = [-4.8;-3.4;-2.6;-2.0;-1.4; 1.6;2.0;2.8;3.6; 4.4]; %degrees
theta_gron = [-6.4;-5.8;-4.6;-3.6;-2.8;2.8;4;4.8; 5.8; 6.6];
theta_bla =  [-9.8;-7.6;-6.0;-4.8;-3.8;4.0;5.0;6.4;7.8;9.8];

% gjennomsnittlig B-gjennom spolen/flint
B = [-119;-102;-83;-63;-43;43;63;83;102;119]*10^(-3); %mT

% antar at B-er neglisjerbar.

% beregning av Verdet-konstanten i 1/Tm
L = 30*10^(-3); % meter

%rød
Vr = theta_rod./(L.*B);
Vr_mean = mean(Vr)

%grønn
Vg = theta_gron./(L.*B);
Vg_mean = mean(Vg)

%blå
Vb = theta_bla./(L.*B);
Vb_mean = mean(Vb)

verdet = [Vb_mean; Vg_mean; Vr_mean]
dL = 1*10^(-3)% m
d_verdet = dL/(30*10^(-3)).*verdet
lambda = [440;505;595]

figure()
plot(lambda,verdet,'.-')
xlabel('\lambda [nm]')
ylabel('Verdet-konstanten [^{o}/Tm]')


function [val] = D_par(f)
    if f > 1; 
        val = 1/(1-f^2)*(1-f/(sqrt(f^2-1))*log(f+sqrt((f^2)-1)));
    elseif f == 1
        val = 1/3; 
    elseif 0 < f && f < 1 
        val = 1/(1-f^2)*(1 - f/sqrt(1-f^2)*acos(f));
    end
end

function [val] = D_orto(f)
Dp = D_par(f);
val = (1- Dp)/2;
end

