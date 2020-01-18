p1 = [1,3,-1,-3,-1,1]
p2 = [1,-1,4,-4]

ans1 = sdrot(p1)
ans2 = sdrot(p2)

rt1 = roots(p1)
rt2 = roots(p2)

A = [1 1 1 1 1 1;1 2 3 4 5 6; 1 3 6 10 15 21; 1 4 10 20 35 56;
    1 5 15 35 70 126; 1 6 21 56 126 252]
p_A = poly(A)
ans3 = sdrot(p_A)
eig(A)

% funksjoner må alltid stå på slutten av programmet
function rot = sdrot(p) % p = [1 an_1 an_2 ... a_0]
    n = length(p) - 1;
    p = p(2:n+1);
    
    x = rand([n,1]);  %tilfeldig vektor, elem maks 1
    C = zeros(n,n);     % kompanion-matrise tilhørende p
    for i = 1:n-1
        C(i,i+1) = 1;
    end
    C(n,:) = fliplr(-p);
    xvals = [];
    muvals = [];
    tol = 0.1*10^(-5);
    for i=1:100
        x = C*x;
        [maxval,maxnr]=max(abs(x));
        mu = x(maxnr);
        x = (1/mu)*x;
        muvals = [muvals mu];
        xvals = [xvals x];
        error = max(abs(C*x-mu*x));
        if error<tol
        break;end
    end
    rot = mu,x;
end

%{
Kjøreeksempel
mat1120_inn2_lassst

p1 =

     1     3    -1    -3    -1     1


p2 =

     1    -1     4    -4


rot =

   -3.0523


ans1 =

   -3.0523


rot =

    3.9464


ans2 =

    3.9464


rt1 =

  -3.0523 + 0.0000i
  -0.6977 + 0.4952i
  -0.6977 - 0.4952i
   1.0000 + 0.0000i
   0.4476 + 0.0000i


rt2 =

  -0.0000 + 2.0000i
  -0.0000 - 2.0000i
   1.0000 + 0.0000i


A =

     1     1     1     1     1     1
     1     2     3     4     5     6
     1     3     6    10    15    21
     1     4    10    20    35    56
     1     5    15    35    70   126
     1     6    21    56   126   252


p_A =

   1.0e+04 *

    0.0001   -0.0351    0.6084   -1.3869    0.6084   -0.0351    0.0001


rot =

  332.8463


ans3 =

  332.8463


ans =

    0.0030
    0.0643
    0.4893
    2.0436
   15.5535
  332.8463
}%

