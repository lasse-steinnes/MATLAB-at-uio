


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksempel p bruk
% Forskjellige mter  gjre tilpasning til data.
% Kjr programmet mange ganger og se hvordan resultatene varierer
% Lager syntetiske data med sty
x=(5:10)';
std_noise=4;
noise=std_noise*randn(size(x));
y=x.^2+noise;
% Alltid plott datapunktene, ikke linjen mellom datapunktene!!!!!
% Hvis du har et estimat for usikkerheten til mlepunktene br du
% plotte med errorbar

figure(1)
subplot(1,2,1), errorbar(x,y,std_noise.*ones(size(x)),'ob','LineWidth',2)
xlabel('x'), ylabel('y')
subplot(1,2,2), errorbar(x.^2,y,std_noise.*ones(size(x)),'ob','LineWidth',2)
xlabel('x.^2'), ylabel('y')
% 3 modeller y = X * b
% 1)
X1 = x.^2;
[b1,stb1]=linregr(X1,y);
subplot(1,2,1), hold on, plot(x,X1*b1,'-k','LineWidth',2), hold off
subplot(1,2,2), hold on, plot(X1,X1*b1,'-k','LineWidth',2), hold off
% 2)
X2 = [x x.^2];
[b2,stb2]=linregr(X2,y);
subplot(1,2,1), hold on, plot(x,X2*b2,'--r','LineWidth',2), hold off
subplot(1,2,2), hold on, plot(X1,X2*b2,'--r','LineWidth',2), hold off
% 1)
X3 = [ones(size(x)) x x.^2];
[b3,stb3]=linregr(X3,y);
subplot(1,2,1), hold on, plot(x,X3*b3,'-.b','LineWidth',2), hold off
subplot(1,2,2), hold on, plot(X1,X3*b3,'-.b','LineWidth',2), hold off

function [ b,stdb ] = linregr( X,Y )
b = X\Y;        % Least squares solution to the equation Y=X*b
E = Y - X*b;    % Errors in each point
MSE = (E'*E)/(length(Y)-size(X,2));         % Mean squared errors
Covar = MSE.*inv(X*X);     % Covariance matrix
stdb = diag(sqrt(Covar));   % Standard error of fitting coefficients
end