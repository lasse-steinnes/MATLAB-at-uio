% Prelab bølgeoptikk

%oppgave 2
R = 1.097*10^7;

for i = 1:10;
    n1 = zeros(1,9) + i;
    n2 = linspace(2,10,9); % kunne gjerne hatt en if else her og printet ut i det synlige spekteret.
    disp(i)
    lambda = 1./(R.*(1./(n1).^2-1./(n2.^2)))
end

% oppgave4 
% skal lage skript som returnerer illuminansen av i diffraksjonsmønsteret 
% variable: x,a,R,N,A,
% for en eller flere spalter 
% lambda0 = 632.8 nm (He-Ne)
% x er en vektor 
% obs for tilfellet der x = 0 for sinus, velg sinc og alfa s.a lim -> 0 f(x)= 1
% velg en proporsjonalitetskonstant alfa.

% oppgave 6
mm = 10^(-3);
nm = 10^(-9);


x_mm = -50:0.1:50;
x = x_mm*mm;  % meter 
R = 5; % m 
lambda = 632.8*nm;
a = 0.12*mm; % spaltebredde, m
N = 1; % antall spalter
A = 0;

figure()
E = illuminate(x,a,R,N,A);
plot(x,E);

% 11: B felt
c = 3*10^8;
c2 = pi/(lambda*R)
t = 3*10^(-3) ;
d1 =10*10^(-2);
d2 = 11*10^(-2);
d3 = 11.5*10^(-2);
delta_ny = c/(2*t)*((d2^2 - d1^2)/(d3^2-d1^2));
mu_b = 9.274*10^(-24);
h = 6.63*10^(-34);
B = delta_ny*h/(2*mu_b)

% oppgave 11
%matrise = imread('zeeman1.bpm')

function values = illuminate(x,a,R,N,A)
lambda = 632.8*10^(-9)
u = x/(lambda*R);
alfa = 1/N;
    if A == 0
       values = a^2.*sinc(a.*u).^2;
    else 
        values = a^2.*(alfa*(sin(N*pi*A.*u)./sin(pi*A.*u)).*sinc(a.*u)).^2;
    end
end




