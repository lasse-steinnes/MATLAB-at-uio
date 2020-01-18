% prelab brown

matrise = imread('gitter20x.png'); % m*n*3 matrise, dvs tre indekser.
I = mean(matrise,3);

imagesc(I);

% må ha intensitetsplott for indeksene for å finne pixel/mm
% husk 20x forstørring
j_dex = linspace(1,length(I(:,500)),length(I(:,500)));
i_dex = linspace(1,length(I(500,:)),length(I(500,:)));

figure()
subplot(2,1,1)
plot(j_dex,I(:,500)) % vertikalt snitt
title('vertikalt snitt')

subplot(2,1,2)
plot(i_dex, I(500,:)) % horiosntalt snitt
title('horistontal snitt')
ylabel('I')
xlabel('pixelindex')



