% prelab bevegelsesmotstand
% rekkefølge e05,e04, e02,e03 i datasettet
% måling av kule med ulik radius, felles massetetthet
% 1. kolonne er radius (m)
% 2.-4. er terminalhastigheter (m/s)

%radius = e05 
%hastighet_vektor = [e04,e02,e03];

%hold on 
%plot(log(radius),log(e04),'-.');
%plot(log(radius),log(e02),'-o');
%plot(log(radius),log(e03),'-*');


% kulens hastighet mm/s 
fps = 30.0224;
duration = 7.509;
distance = 25.5;
speed = fps*distance/6.6 % fant ikke helt ut av denne 
% fant ikke helt ut av usikkerheten!!! Ikke det samme som usikkerheten i
% stigningstallet.