% Tasks for assignment 3
%{
Check
a = [1;0;0;0]
b = [0,1,0,0]
M = a*b
%}
%%

L = 25;
g = 1;
V = 5;

%%
% Setting up the hamiltonian matrix

H = zeros(L-1,L-1);

% Setting V in the matrix
H(1,1) = -V;

for i=1:L-1
    H(i+1,i) = -g;
    H(i,i+1) = -g;
end

H; 

% Making the position matrix
X = zeros(L,L);

for i = 2:L
    X(i,i) = i-1;
end

X;

%% Eigenvalues of hamiltonian H numerically
[eigenkets, eigval] = eig(H);
eigval = eig(H);

%% Plotting energy diagram
stem(eigval)
title('Energy Diagram')

%% System in ground state, want to find the probability at place 0 and 1
E0 = eigval(1)
poskets = eye(L);
ket0 = poskets(:,1);
eigketoenergy0 = eigenkets(:,1);
prob = (transpose(ket0)*eigketoenergy0)^2

ket1 = poskets(:,2);
eigpos1 = eigenkets(:,1);
prob1 = (transpose(ket1)*eigketoenergy0)^2

%% Expectation value of position when in ground state
newket = X*eigketoenergy0
E_pos = transpose(eigketoenergy0)*newket

%% Probability of electron being on atom 0 after time t 
% We have the Hamiltonian, and know that its not in its ground state
% pos li
dt = 120/1000
prob = zeros(1001,1)
c = zeros(L,1);

for t = 1:1001
    null_t = zeros(L,1);
    for i =1:L
        c(i) = transpose(eigenkets(:,i))*(poskets(:,1));
        null_t = null_t + c(i)*exp(-1j.*eigval(i)*dt*(t-1))*eigenkets(:,i);
    end
    prob(t) = abs(transpose(null_t)*poskets(:,1))^2;
end
t = linspace(0,1000,1001); % multiples of hbar, so can exclude it from equation
%probs = (transpose(poskets(:,1))*kets)^2
%values = probs*(exp(-1j.*eigval(1).*t)) %.^2 ?
plot(dt*t,prob)

%% Task 3.9
v1 = [1; -1j/2; 0]
v2 = [1j/2; 1;0]
v3 = [0;0;1/2]
H2 = [v1, v2, v3]

%% Showing that H is hermitian
H2cross = conj(transpose(H2))

%% eigket and eigvalues
ket1 = 1/sqrt(2).*[1j;1;0];
ket2 = [0;0;1];
ket3 =1/sqrt(3).*[-1j;1;-1] ;

val1 = H2*ket1 -ket1 % 0.3536
val2 = H2*ket2 - ket2 %-0.5
val3 = H2*ket3 -ket3 % 2.887

%% Compute matrix elements of H in the eigenketbasis
% So we have
%H_b = v1*transpose(H2*ket1) + v2*transpose(H2*ket2) + v3*transpose(H2*ket3)
R = rref([ket1, ket2, ket3,v1,v2,v3]);
Pvtoket = R(:,4:6); % change of basis matrix
% Apply change of basis matrix on H2
H_kbasis = Pvtoket*H2 % not diagonal!!

%% Compute matrix element of H represented by an orthonormal basis (PS: Should have been with eigenket)
w = [[1;0;0],[0;1;0],[0;0;1]]
R2 = rref([w,v1,v2,v3])
Pvtoket2 = R2(:,4:6)
H_k2basis = Pvtoket2*H2 % diagonal in real values