
function values = illuminate(x,a,R,N,A)
lambda = 632.8*10^(-9)
u = x/(lambda*R);
alfa = 1/N
    if A == 0
       values = a^2.*sinc(a.*u).^2
    else 
        values = a^2.*(alfa*(sin(N*pi*A.*u)./sin(pi*A.*u)).*sinc(a.*u)).^2
    end
end

