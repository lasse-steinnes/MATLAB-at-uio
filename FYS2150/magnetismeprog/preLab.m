L = 30*0.001; %m
dL = 1*0.001; %m

V = theta/(B*L);

%mV = mean(V);

dV = (dL/L)*V;

%%
[p1, r1] = D(3);
[p2, r2] = D(1.75);
[p3, r3] = D(1);
[p4, r4] = D(0.1);