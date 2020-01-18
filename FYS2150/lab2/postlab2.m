% behandling av data fra lab 2
% inputspenning: 1 Volt amplitude
outputV2 = [1.973 1.646 1.192 0.8927 0.7021 0.5752 0.4862 0.4202 0.3699 0.3294 0.2964 0.03049 0.00308 0.00000232];
lavoutputV = outputV2/2;
inputV = zeros(1,2*length(lavoutputV)) + 1;
frekvens = [9.998 100 200 300 400 500 600 700 800 900 1000 10000 100000.2 4*10^6];

plot(log10(frekvens),log10(lavoutputV))
hold('on')

frekv = frekvens(6:13);
vi = lavoutputV(6:13);
nyfrekvens = linspace(0,7,100);

coeffs = polyfit(log10(frekv),log10(vi),1) % finner log omega0
ffit = polyval(coeffs,nyfrekvens);

plot(nyfrekvens,ffit,'-');
xlabel('frekvens log10[Hz]')
ylabel('spenning log10[V]')

model = vuvi(frekv,coeffs(2));
plot(log10(frekv),model)

C = 1/(136.6155*10^3)

frekvens2 = [10 100 1000 10000 100000 1*10^6]
hoyoutputV = [0.1247 1.035 1.08 0.3786 0.01701 0.03]/2
plot(log10(frekvens2),log10(hoyoutputV))

% Skal beregne R fra målt spenning og strøm
spenning1 = [1.4042,1.404,14.54];
strom1 = [43.849e-3,116e-3,0.1];
spenning2 = [1.1050,1.128];
strom2 = [26.801e-3,58.9e-3];
R1 = spenning1./strom1;
R2 = spenning2./strom2;

% feilverdier
%e_spenning1, leser av fra labpartner
%e_strom1 =
e_spenning2 = [100e-6,0.001];
e_strom2 = [1e-6,0.01e-3];
sigma_squared2 = sqrt((e_spenning2./spenning2).^2 + (e_strom2./strom2).^2).*R2;


function val = vuvi(omega,omega0)
   val =  -0.5*log10(1+(omega/(10^omega0)).^2)
end
