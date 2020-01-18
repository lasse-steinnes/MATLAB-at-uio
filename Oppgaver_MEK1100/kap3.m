% 3.f Skal plotte vektorfeltene
% a. Pilene peker ut fra origo, lengst nær origo
[x,y] = meshgrid(-5:1:5);
vx = x./(x.^2 +y.^2);
vy = y./(x.^2 +y.^2);
quiver(x,y,vx,vy,1);
hold off

% b , y negativ. Piler inn mot origo og ut langs aksene. Lengst mot origo
[x,y] = meshgrid(-5:1:5);
vx = x./(x.^2 +y.^2);
vy = -y./(x.^2 +y.^2);
quiver(x,y,vx,vy,0.8);


% c, vx og vy bytter plass, fortsatt lengst piler inn mot origo, først inn
% mot origo for så å strømme ut langs diagonalen
[x,y] = meshgrid(-5:1:5);
vy = x./(x.^2 +y.^2);
vx = y./(x.^2 +y.^2);
quiver(x,y,vx,vy,0.8);

% d, Negativ fortegn på vy, og fortsatt byttet plass.
% Spiral utover, rotasjon mot høyre.
[x,y] = meshgrid(-5:1:5);
vy = -x./(x.^2 +y.^2);
vx = y./(x.^2 +y.^2);
quiver(x,y,vx,vy,0.8);

% 3d
x = linspace(-10,2,100);
y = (x.^2).*exp(1/2.*x);
plot(x,y);


a = sqrt(8.66^2 + 2.3^2)
theta = acos(-2.3/a);
vinkel =180*theta/pi








