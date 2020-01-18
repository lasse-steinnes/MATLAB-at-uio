% Oppgave 1
% Skal beregne p^k 
% Deretter sannsynlighet for s4 --> s2
P = [1 0.7 0 0 0; 0 0 0.5 0 0;
    0 0.3 0 0.6 0; 0 0 0.5 0 0; 0 0 0 0.4 1];

for k = [2,3,4,50,100]
    new_stock = P^k
    p42 = new_stock(4,2)
end
%{
Kjøreeksempel mat1120_inn1_lassst
new_stock =

    1.0000    0.7000    0.3500         0         0
         0    0.1500         0    0.3000         0
         0         0    0.4500         0         0
         0    0.1500         0    0.3000         0
         0         0    0.2000    0.4000    1.0000
p42 =

    0.1500


new_stock =

    1.0000    0.8050    0.3500    0.2100         0
         0         0    0.2250         0         0
         0    0.1350         0    0.2700         0
         0         0    0.2250         0         0
         0    0.0600    0.2000    0.5200    1.0000


p42 =

     0

new_stock =

    1.0000    0.8050    0.5075    0.2100         0
         0    0.0675         0    0.1350         0
         0         0    0.2025         0         0
         0    0.0675         0    0.1350         0
         0    0.0600    0.2900    0.5200    1.0000

p42 =

    0.0675

new_stock =

    1.0000    0.8909    0.6364    0.3818         0
         0    0.0000         0    0.0000         0
         0         0    0.0000         0         0
         0    0.0000         0    0.0000         0
         0    0.1091    0.3636    0.6182    1.0000

p42 =

   7.1317e-10


new_stock =

    1.0000    0.8909    0.6364    0.3818         0
         0    0.0000         0    0.0000         0
         0         0    0.0000         0         0
         0    0.0000         0    0.0000         0
         0    0.1091    0.3636    0.6182    1.0000


p42 =

   1.5258e-18
%}

% Oppgave 2
% regularitet
I5 = eye(5,5);
rref(P-I5)
null(P-I5, 'r')
% nei, den har ikke entydig likevektsvektor
%{
Kjøreeksempel:

ans =

     0     1     0     0     0
     0     0     1     0     0
     0     0     0     1     0
     0     0     0     0     0
     0     0     0     0     0


ans =

     1     0
     0     0
     0     0
     0     0
     0     1
%}


% Oppgave 5
% d) Sjekk a og b
% inputvektor p2,p3,p4
% sjekk at 0 < pj < 1
% beregner qj = 1 - pj for j = 2,3,4
% setter opp matrisen A og vektoren b
% løser Ay = b, returnerer vektoren y = x2, x3, x4.
p = [0.15,0.5,0.35]; 
m = Walk(p)

function f = Walk(x)
    q = zeros(1,3);
    for j = [1,2,3]
        if not
            0 < x(j) < 1;
            break
        else
            q(j) = 1 - x(j);
        end
    end
    A = [1 -q(1) 0; -x(2) 1 -q(2); 0 -x(3) 1];
    b = [x(2),0,0];
    f = inv(A)*b;
end

%{
Kjøreeksempel
Error using mat1120_inn1_lassst>Walk (line 42)
Not enough input arguments.

Error in mat1120_inn1_lassst (line 37)
m = Walk(p)
%}







 



