theta_bla =  [-9.8;-7.6;-6.0;-4.8;3.8;4.0;5.0;6.4;7.8 ;9.8];

% gjennomsnittlig B-gjennom spolen/flint
B = [-119;-102;-83;-63;-43;43;63;83;102;119]*10^(-3) %mT

% antar at B-er neglisjerbar.

% beregning av Verdet-konstanten i 1/Tm
L = 30*10^(-3) % meter

Vb = theta_bla./(L.*B);
Vb_mean = mean(V)
Vb_stmean = std(V)/sqrt(length(V))