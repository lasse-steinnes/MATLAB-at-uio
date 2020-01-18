% Labdag1: Måling av tid
%Usikkerhet i målingene 
s1 = [119 123];
s2 = [113 115];
m1 = mean(s1);
m2 = mean (s2);
meantotal = mean([s1 s2]);
st1 = std(s1)/sqrt(2);
st2 = std(s2)/sqrt(2);

% antall svingninger ila 3 min jamfør målt svingetid
pres_s = 2*1.59

% postlab!!! svingetid med fotodiode
perioder = periods;
tider = []
tidsum = 0
for i = 1:length(perioder)
    tidsum = tidsum + perioder(i);
    tider(i) = tidsum;
end
tider;
hist(periods);
title('(1) Histogram over svingetid, 25khz, 30 cm');
ylabel('Antall perioder');
xlabel('Svingetid');

tider2 = []
tidsum = 0
for i = 1:length(periods2)
    tidsum = tidsum + periods2(i);
    tider2(i) = tidsum;
end
cftool
