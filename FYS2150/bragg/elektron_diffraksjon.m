%Elektrondiffraksjon
I = [0.008;0.01;0.013;0.015;0.018;0.021;0.024;0.028;0.031;0.035;0.039]*10^(-3) %ampere
U_forsyning = [3.00; 3.20; 3.40; 3.60; 3.80; 4.00; 4.20; 4.40; 4.60; 4.80; 5.00]; %Spennning 
U = U_forsyning - 10*(10^6)*I*10^(-3)  % spenning, kV

d1y = [5.8; 5.6; 5.4; 5.3; 5.1; 4.9; 4.8; 4.8; 4.6; 4.8; 4.7];
d1i = [5.1; 5.0; 4.9; 4.7; 4.7; 4.4; 4.4; 4.4; 4.2; 4.3; 4.1]; % cm alt beregnet i cm
D_ytre = (d1y+d1i)./2;  %Diameter til ytre sirkel

d2y = [3.6; 3.4; 3.3; 3.2; 3.1; 3.1; 3.0; 2.9; 3.0; 3.0; 2.9];
d2i = [3.1; 3.0; 2.9; 2.8; 2.7; 2.6; 2.7; 2.5; 2.5; 2.4; 2.4];
D_indre = (d2y+d2i)./2; %Diameter til indre sirkel

% D er diameteren som er målt 

% 
lambda = lc(U).*relfactor(U)

% gitterplanavstand
d_10 = mean(diameter(lambda,D_indre)) % sett inn array for indre og ytre, eller er 
d_11 = mean(diameter(lambda,D_ytre))
ratio = d_10/d_11

sigma_d10 = std(diameter(lambda,D_indre))/sqrt(length(lambda))
sigma_d11 = std(diameter(lambda,D_ytre))/sqrt(length(lambda))

% Beregning av geometriske størrelser tilhørende d_ytre (d11) og d_indre (10)
L = 14;
phi_ytre = mean(lambda./D_ytre);
phi_indre = mean(lambda./D_indre);

d_ytre = 2*L*phi_ytre
d_indre = 2*L*phi_indre

sigma_phi_ytre = std(lambda./D_ytre)/sqrt(length(D_ytre)); %statistisk usikkerhet til phi
sigma_phi_indre = std(lambda./D_ytre)/sqrt(length(D_ytre));

d_usikkerhet_indre = usikkerhet(phi_indre,sigma_phi_indre,d_indre)
d_usikkerhet_ytre = usikkerhet(phi_ytre,sigma_phi_ytre,d_ytre)

% beregning av lambda c
function [lambda_fac] = lc(U)
    e = 1.602e-19;
    m_e = 9.109e-31;
    c = 299792458;
    lambda_fac = sqrt((m_e*c^2)./(2*e.*U*10^3))*(2.426*10^(-12));
end

% relativ faktor
function [f] = relfactor(U)
    e = 1.602e-19;
    m_e = 9.109e-31;
    c = 299792458;
    f = 1./sqrt(1+e.*U*10^3/(2*m_e*c^2));
end

% beregning av gitterplanavstand
function [d] = diameter(lambda, D)
    L = 14.0;
    [d] = (2*lambda*L)./D;
end

% beregning av usikkerhet i d
function [sigma] = usikkerhet(phi, del_phi,d)
    L = 14;
    del_L = 0.3;
    sigma = sqrt((del_phi/phi)^2 + (del_L/L)^2)*d;
end

