% Generer et datasett
a=3.5; %Parameter for konstantledd i generert datasett
b=5.0; %Parameter for helning i generert datasett
x=0:0.1:2;
stoy = randn(1,length(x));
y=a+b.*x+stoy;
figure(1)
plot(x,y,'r*')
%Tilpass med line�r modell
[p,S]=polyfit(x,y,1);
%Tilpasningsparametre m og c i y=m*x+c:
m=p(1);
c=p(2);
yline = polyval(p,x);
hold on
plot(x,yline,'-')
xlabel('x')
ylabel('y')
legend('data',['linfit: ',num2str(c),'+',num2str(m),'x'],'Location','NorthWest')
hold off

% standardavvik
stoy_sm = std(stoy)/sqrt(length(x))

% Calculate the covariance matrix C from S (see help for polyfit)
Rinv=inv(S.R);
C = (Rinv*Rinv')*S.normr^2/S.df;

% The diagonal elements of C are the variances of the parameters.
% Non-zero off-diagonal elements indicate a covariance between the
% parameters.
dm = sqrt(C(1,1)); % Error in the slope
dc = sqrt(C(2,2)); % Error in the intercept

fprintf('slope     = %6.4f +- %5.4f\n',m,dm)
fprintf('intercept = %6.4f +- %5.4f\n',c,dc)
