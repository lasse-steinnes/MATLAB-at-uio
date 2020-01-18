plot(log10(frekvens),log10(Vu_over_Vi),'o')
xlabel('frekvens')
ylabel('v_u over v_i')
hold('on')

nifrekv = frekvens(12:20);
nivu_over_vi = Vu_over_Vi(end-8:end);
nyfrekvens = linspace(0,1,100);

coeffs = polyfit(log10(nifrekv),log10(nivu_over_vi),1) % finner log omega0
ffit = polyval(coeffs,nyfrekvens);

plot(nyfrekvens,ffit,'-');

model = vuvi(nifrekv,coeffs(2));
plot(log10(nifrekv),model)


function val = vuvi(omega,omega0)
   val =  -0.5*log10(1+(omega/(10^omega0)).^2)
end

