% Oppgave 2
% Skal ikke bruke eig(M), det(M), rref(M)
% a) Skal skrive et program som leser fire verdier, og beregner
% egenverdiene

% Leser først inn verdiene, antar at tallene er i en tekstfil på formen
%a b c  d 
% laste ned data 
filename = fullfile(matlabroot,'ABCDfil.txt')

inndata = fopen('ABCDfil.txt', 'rt');
C = textscan(inndata,'%f %f %f %f')
fclose(inndata);
% celldisp(C) Undersøk input

a = C{1};
b = C{2};
c = C{3};
d = C{4};

%egenverdiene blir 

lambda1 = (a+d) + sqrt((-(a+d))^2 - 4*a*d)/2
lambda2 = (a+d) - sqrt((-(a+d))^2 - 4*a*d)/2

% b) Skal skrive et program som beregner en av egenvektorene
% En av egenvektorene kommer som resultat fra  lambda1
% Løser man Ax = lambda1x, så får man
if (b ~= 0);
    x = 1;
    y = d + sqrt((-(a+d))^2 - 4*a*d)/(2*b)*x;
   
else
    y = 1;
    x = a + sqrt((-(a+d))^2 - 4*a*d)/(2*c)*y;
end 
    
disp(['x:',num2str(x)])
disp(['y:',num2str(y)])

% Oppgave 4c
% Finner egenverdier og egenvektorer
A = [40 1; -1 40];
[u,v] = eig(A);
M = [1 1; i -i];
r1 = [2;80];
c = M\r1;

% oppgave 4d
% Utregning for n 
theta = acos(sqrt(1600/1601));
n = pi/(2*theta)-1;

%{
Kjøring av matrise 1
C =
1×4 cell array
[-5]    [4]    [3]    [-1]
lambda1 =
 -4
lambda2 =
 -8
x:1
y:-0.5

%}

%{
Matrise 2

C =

  1×4 cell array

    [3]    [0]    [5]    [1]


lambda1 =

     5


lambda2 =

     3

x:3.2
y:1
%}

%{
Matrise 3
C =

  1×4 cell array

    [2]    [7]    [0]    [1]


lambda1 =

    3.5000


lambda2 =

    2.5000

x:1
y:1.0714
%}

%{
Matrise 4
C =

  1×4 cell array

    [1]    [0]    [0]    [0]


lambda1 =

    1.5000


lambda2 =

    0.5000

x:Inf
y:1
%}



