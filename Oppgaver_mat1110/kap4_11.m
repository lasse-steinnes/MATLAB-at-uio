% kap 4_11: Egenvektorer i praksis. 
% Oppgave 1:
A = [1 3;2 2];
[u,v] = eig(A);

r1 = [5; -5];
u = [0.83*1.8 1; -0.55*1.8 1];
c = u\r1;

% Oppgave 3
B = [1.1 -.2; 0.1 0.8];
[eigu,eigv] = eig(sym(B));
r1 = [3000;1000];
D = [1 2; 1 1];
c = D\r1;

% Oppgave 4
C = [0.9 0.1;0.1 0.9];
[u,v] = eig(sym(C));

D = [-1 1; 1 1];
r1 = [2;4];
c = D\r1;

% Oppgave 7.
% b) Egenverdier og egenvektor
M = [0 3 4; 1 0 0; 0 0.5 0]
[u,v] = eig(sym(M))
D = [8 2;4 -2;1 1]
r1 = [24; 0; 6]
c = D\r1

