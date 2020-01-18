%{
dU=[-0.039 -0.077 -0.116 -0.154 -0.193 -0.231 -0.269 -0.307 -0.345 -0.383...
   0.000  0.039  0.078  0.117  0.156  0.195  0.234  0.273  0.312  0.352 ...
   0.391  0.431  0.470  0.510  0.549  0.589  0.629  0.669  0.709  0.749  ...
   0.790  0.830  0.870  0.911  0.951  0.992  1.033  1.074  1.114  1.155  ...
   1.196  1.238  1.279  1.320  1.362  1.403  1.445  1.486  1.528  1.570  ...
   1.612  1.654  1.696  1.738  1.780  1.823  1.865  1.908  1.950  1.993 ];
T= [-1:-1:-10 0:49];
plot(T,dU,'*')
xlabel('T, C')
ylabel('Termospenning   \Delta{U}, mV')

% Beregner temp i al klossen ut fra spenning
al_temp = temp(0.740)
%}

% Postlabberegninger og plot fra del C - varmeledning i metallstang
% dataene som skal hentes ut er merket T og time

time = t(23:end) - t(23)

% skal ha t = 0 når 23 datapunkt

% temperatur mot tid
for j = 1:4
    plot(time,T(23:end,j),'o')
    hold on
    xlabel('tid [s]')
    ylabel('temperatur [C]')
end
hold off

% temperatur mot ny i
posx = [1.02,3.0,9.0,17.0]*(1/100) % i meter

figure;
for j = 1:4
        nu = posx(j)./sqrt(4*time);
        plot(nu,T(23:end,j),'o')
        xlabel('nu [m/sqrt(s)]')
        ylabel('temperatur [C]')
        hold on
end
hold off

% erfinv mot ny i 
T0 = 21.6; % temp i stanga ved tid 0
T1 = 0; % temp i endestykket stabilt rundt 0
figure;
for j = 1:4
    nu = posx(j)./sqrt(4*time(13:end));
    error = erfinv(T(35:end,j)/T(35,j));
    plot(nu,error,'o')
    xlabel('nu [m/sqrt(s)]')
    ylabel('Erfinv(T/T0)')
    hold on
end
hold off


% lineærregresjon med minste kvadraters metode fra punkt 4 (mest stabil)
timetoreg = time(10:100) ;
temptoreg = T(23+10:100+23,4) ;
n = length(temptoreg);

figure;
nu = posx(4)./sqrt(4*timetoreg);
error = erfinv(temptoreg/T(23,4));
plot(nu,error,'o')
xlabel('nu [m/sqrt(s)]')
ylabel('Erfinv(T/T0)')

summ = 0;
for i=1:n
    summ = summ + error(i)*nu(i);
end

xmu = 1/n*sum(nu);
ymu = 1/n*sum(error);

D = sum(nu.^2) - 1/n*(sum(nu))^2
E = summ - 1/n.*sum(nu)*sum(error);
F = sum(error.^2)-1/n*(sum(error)^2);

alfa = E/D
delta_alfa = sqrt(1/(n-2)*(D*F - E.^2)/D^2)

c = ymu - alfa*xmu

% diffusivitet fra modellen
diffusT = (nu/(alfa*nu+c))^2

% sigma diffusT
d_diffT = delta_alfa/alfa*diffusT 

function T = temp(U)
    T= 24.83*U + 0.08642;
end





