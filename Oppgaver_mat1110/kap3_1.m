% 3.1 Parametriserte kurver
% Oppgave 5
% a 
t = linspace(0,6*pi,1000);
x = t.*cos(t);
y = t.*sin(t);
plot(x,y);
axis('equal');
% Høyrevridd spiral, mot klokka, i 2d

% b
t = linspace(0,2*pi,1000);
x = 5*cos(t);
y = 3*sin(t);
plot(x,y);
axis('equal');
%Ellipse, merk at x og y er ulikt multiplum.

%10e
% Skal plotte i 3d
t = linspace(0,2*pi,1000);
x = 2*cos(t);
y = sqrt(2)*sin(t);
z = sqrt(2)*sin(t);
plot3(x,y,z)
axis('equal')
grid on

% Går langs diagonalen, ser ellers ut som en ellipse.


