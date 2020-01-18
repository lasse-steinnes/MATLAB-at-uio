
function T = termistortemp(R)
    a = 8.420e-4;
    b = 2.068e-4;
    c = 8.591e-8;
    R0 = 1; 
    T = 1./(a + b.*log(R/R0) + c.*(log(R/R0)).^3) - 273.16;
end
% returnerer en vektor [1E6,20E3]
