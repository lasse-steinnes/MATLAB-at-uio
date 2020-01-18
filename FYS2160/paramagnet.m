M = 10^4  % number of microstates
N = 60 % number of spins

% generate S-array
S = zeros(1,M);

for j = 1:M 
    X = randi([0 1],1,N);
for i = 1:60
    if X(i) == 0
        X(i) = -1;
    end
end
S(j) = sum(X);
end


figure(1)
histfit(S,30)
title('2.3:Total spins')
xlabel('Net spin (S)')
ylabel('Total number with spin S')
hold off

% plotting S for each microstate
figure(2)
ind = linspace(1,M,M);
scatter(ind,S,'o')
title('2.3: Net spin S for each microstate (10^4)')
xlabel('total spin (S)')
ylabel('Microstate')
hold off

% calculating multiplicity 
S_ = linspace(-60,60,121)
m = mult(S_,N);
figure(3)
plot(S_,m) % around zero
title('2.5: Multiplicity for N = 60')
xlabel('Net spin (S)')
ylabel('Multiplicity')
hold off


% Entropy
k = 1.3806505*10^(-23); % J/K
S_B = k*log(mult(S_,N))

figure(4)
plot(S_,S_B) % more disordered if S = 0
title('Entropy as function of N = 60, and net spin S')
xlabel('Net Spin (S)')
ylabel('Entropy (S_{B})')
hold off

%Multiplicity
function [m] = mult(s,n)
mmax = 2.^n.*sqrt(2)./sqrt(pi.*n);
m = mmax.*exp(-s.^2./(2.*n));
end




