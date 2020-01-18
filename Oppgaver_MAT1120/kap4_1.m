% Oppgave kap.4.1 vektorrom og underrom
% 37: funksjon 1:
t = linspace(0,2*pi,101);
f = 1 - 8*(cos(t)).^2 + 8*(cos(t)).^4;
y1 = cos(4*t);
g = -1 + 18*cos(t).^2 - 48*cos(t).^4 + 32*cos(t).^6;
y2= cos(6*t);

figure
subplot(2,2,1)
plot(t,f)
hold on
plot(t,y1)
hold off
title('plot 1')

subplot(2,2,2)
plot(t,1+f-y1)

% funksjon 2:
subplot(2,2,3)
plot(t,g)
hold on
plot(t,y2)
hold off
title('plot 2')

subplot(2,2,4)
plot(t,1+g-y2)




