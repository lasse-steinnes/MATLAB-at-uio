%Målinger med LiF-krystall

%Første sett med målinger som ikke ga god plot
grad_1 = [12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,18.5,19,19.5,20, 20.5, 21, 21.5, 22, 22.5];
intensitet_1 = [469,505,501,489, 569, 555, 596, 610, 628, 700, 730, 737, 719, 761, 794, 805, 887, 939, 957, 924, 950, 953];
%plot(grad_1,intensitet_1)

%Andre sett med målinger som ga bedre plot
grad = [12,12.5,13,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,18.5,19,19.5,20, 20.5, 21, 21.5, 22, 22.5,23];
intensitet = [279,329,304,277,316,320,299,296,322,358,480,534,721,864,979,1155,1299,1297,1413,1426,1476,1582,1524]/60; % 60 sekunder tellerate
% Gjennomsnitt av bakgrunnsstrålingen trekkes fra
bakgrunn = intensitet(1:8);
grad_bakgrunn = grad(1:8);

mu_bakgrunn = mean(bakgrunn);
s_bakgrunn = std(bakgrunn)/sqrt(length(bakgrunn));

intensitet = intensitet - mu_bakgrunn;

% lager linearregresjon 
lin_horisontal = least_squares(grad_bakgrunn,bakgrunn)
lin_skra = least_squares(grad(10:14),intensitet(10:14))


% Beregne U fra E_maks
% må da benytte vinkelen fra skjæringspunktet 
% gitterplanavstand 
d2 = 401*10^(-3); % nm
theta = 16.35/2;
% bragg
lambda = d2*sind(theta)
hc = 1240; %eV;
E = hc/lambda;  % E har samme verdi fordi eV  21.75 kV

% Må beregne usikkerhet i E_maks/Spenningen over anoden!!
% usikkerhet i theta
m = lin_skra(1);
dtheta = s_bakgrunn/m; 
dlambda = d2*cosd(theta)*dtheta
d_E = cotd(theta)*E*dtheta

% 5.2 usikkerhet for kompliserte funksjoner

% plot
plot(grad,intensitet,'.-')
hold on
plot(grad(1:15),linhor(lin_horisontal(1),grad(1:15)),'-') %
hold on 
plot(grad(8:17),linskrae(lin_skra(1),grad(8:17)),'-')
hold on
plot(16.3531694,0.0967371,'o')
xlabel('Vinkel [grader]')
ylabel('Intensitet [fotoner/sek]')
legend()

function y = linhor(m,theta)
    c1 = -12*m
    y = m*theta + c1
end

function y = linskrae(m,theta)
    c2 = 418.5/60 - m*18
    y = m*theta + c2
end

function values = least_squares(x,y)
n = length(x);
D = sum(x.^2) - 1/n*(sum(x))^2;
E = sum(x.*y)-1/n.*sum(x)*sum(y);
F = sum(y.^2)-1/n*(sum(y)^2);
alfa = E/D;
delta_alfa = sqrt(1/(n-2)*(D*F - E^2)/D^2);
values = [alfa,delta_alfa]
end