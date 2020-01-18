% 2.9 Skal tegne opp høydekonturer
h0 = 1200; % m
a = 250; % m
R = 2; % km

[x,y] = meshgrid(-300:1:300); % det midterste tallet er dx,dy
h = h0 + (a/R).*x.*y;
contour(x,y,h); % variabler x,y av funksjonen h: Konturlinje

[x,y] = meshgrid(-300:50:300); % Grovere grid for gradienten
h = h0 + (a/R).*x.*y; % beregne høyde for det nye grid
vx = a/R.*y; % uttrykk for gradienten
vy = a/R.*x; % uttrykk for gradienten

hold on
quiver(x,y,vx,vy,0.5)
% colorbar
hold off

% Oppgave 10 a.  Må velge a og b til å være bestemte konstanter
a = 2;
b = 1;

[x,y] = meshgrid(-100:1:100); % det midterste tallet er dx,dy
C = a.*y - b.*x;
contour(x,y,C);

% 10b
a = -2;
b = 1;

[x,y] = meshgrid(-100:1:100); % det midterste tallet er dx,dy
C = (1/2)*a.*y.^2 - (1/2)*b.*x.^2;
contour(x,y,C);

% 10c. 
a = 2;
b = 1;

[x,y] = meshgrid(-100:1:100); % det midterste tallet er dx,dy
C = a.*y - b/(2*a).*x.^2;
contour(x,y,C);

% 13. Strømlinjer til et hastighet i x,y,z-planet. 
% Prøver med vanlig notasjon


