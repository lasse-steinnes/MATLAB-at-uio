r_ny = [285,418,561,697,836,974,1115,1253,1392,1531,1667,1809,1950]
resistance = [113.7,113.7,113.7,113.7,113.4,113.4,113.2,113.2,113.2,113.2,113.0,113.0,113.0]*10^3

for i = 2:length(r_ny)
    delta_ny = r_ny(i) - r_ny(i-1)
end

L = 1.243;

y = 2*L*r_ny;
k = linspace(1,length(r_ny),13);

% Finding speed
plot(k,y,'*');

values = least_squares(k,y); % slope would be same no matter what n

delta_speed = sqrt((values(2)/values(1))^2 + ((1.5*10^(-3))/L)^2)*values(1);

% Finding temperature
T = temp(resistance);
Tmean = mean(T);
Tstd = std(T);
R_ = mean(resistance);

% Beregne lyshastigheten
M_co2 = 44*10^-3; % kg/mol
M_o2 = 16*10^-3; % kg/mol
M_N2 = 14*10^-3; %kg/mol
M_ar = 40*10^-3 % kg/mol
M_air = 28.97*10^-3 %(0.21*M_o2 + 0.79*M_N2);

%speed_air = cid_rom2(5,295.15,M_air)
%speed_co2 = cid_rom2(5,295.15,M_co2)

speed_air_2 = cid_rom(1,M_air,R_)
speed_co2_2 = cid_rom(1,M_co2,R_)
speed_arg_2 = cid_rom(3,M_ar,R_)

% linear fit
function values = least_squares(x,y)
n = length(x);
D = sum(x.^2) - 1/n*(sum(x))^2;
E = sum(x.*y)-1/n.*sum(x)*sum(y);
F = sum(y.^2)-1/n*(sum(y)^2);
alfa = E/D;
delta_alfa = sqrt(1/(n-2)*(D*F - E^2)/D^2);
values = [alfa,delta_alfa];
end


% temperature
function value = temp(resistance)
value = 25 - 24*log(resistance/(10^5))
end

function speed = cid_rom2(f,T,M_mol)
R = 8.31;
speed = sqrt((f+2)*R*T/(f*M_mol));
end 

function speed = cid_rom(s,M_mol,R_)
R = 8.31; % J/(K*mol)
t_o = 12.4464;
kid_s = sqrt((8-s)/(6-s)*(24*R/M_mol)); 
speed = kid_s*sqrt(t_o-log(R_/(10^5)));
end