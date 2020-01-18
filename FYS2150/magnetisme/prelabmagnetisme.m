% prelab magnetisme
% datafilen faraday: 
% theta - dreiningsvinkel
% B = B-feltmålinger
% for bestemt lambda
% fra radianer til grader 
L = 30*10^(-3) % meter
B_abs = abs(B) % tesla
V = abs(theta)./(L.*B_abs)
V_mean = mean(V)
V_stmean = std(V)/sqrt(length(V))



