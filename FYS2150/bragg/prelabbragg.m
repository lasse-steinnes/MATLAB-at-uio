% prelaboppgaver braggdiffraksjon
% LiF krystall
intensitet = [130, 124, 133, 131, 128, 132, 138, 192, 244, 301, 348, 403, 462, 508];
vinkler = linspace(12,25,length(intensitet));
%plot(vinkler,intensitet);

fac = relfactor([8])

a_U = e03./10^3;
D_ytre = e02;
lambda = lc(a_U).*relfactor(a_U);
phi = mean(lambda./D_ytre)
sigma_phi = std(lambda./D_ytre)/sqrt(length(D_ytre))


function [lambda_fac] = lc(U)
    e = 1.602e-19;
    m_e = 9.109e-31;
    c = 299792458;
    lambda_fac = sqrt((m_e*c^2)./(2*e.*U*10^3))*(2.426*10^(-12));
end

function [f] = relfactor(U)
    e = 1.602e-19;
    m_e = 9.109e-31;
    c = 299792458;
    f = 1./sqrt(1+e.*U*10^3/(2*m_e*c^2));
end