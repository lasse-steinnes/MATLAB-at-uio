% postlab5 oppgaver
%{
avstand = [52.9;52.0;32.3;56.6;54;46;54]
usikkerhet = [4;19;9;17;12;3;7]

my = mean(avstand)
st_sum = mean(usikkerhet)
%}

% FFT
%{
Energispekter fra ren tone
tidlin = linspace(0,duration,length(fw));
plot(tidlin,fw/dfrek,'o-')
%plot(fw,fw/dfrek)
xlabel('tid (s)')
ylabel('Energi \propto fm/f')
%}

%{
hastighet
tlin = linspace(0,duration,n)
plot(tlin,fw)
%}


% aksellerasjonsoppgaven
%{
stoy_f = fut;
figure()
plot(time,data);
figure()
plot(tw,fw);
stoy_my = mean(fut) 2.4 e4 
%}
%{
plot(tw,fw,'o-')
n1 = 11;
n2 = 16;
n3 = 18;
a = ac_plot(tw,fw,duration,n3)
my = mean(a(4:10))
sigma_my = std(a(4:10))/sqrt(length(a(4:10)))
%}
vinkel = [5.7;7.7;10.1];
aksel_tid  = [1.1;0.56;0.37];
error_tid = [0.04;0.01;0.007];
aksel_frekv = [1.2;0.78;0.5]
error_frekv = [0.5;0.3;0.4];
teoretisk = [1.7;1.3;0.97]
error_teoretisk = [0.5;0.6;0.4]
a1 = plot(vinkel,aksel_tid,'o')
hold on
a2 = plot(vinkel,aksel_frekv,'o')
a3 = plot(vinkel,teoretisk,'-')
M1 = 'tidsmåling'
M2 = 'frekvensmåling'
M3 = 'teoretisk'
legend([a1;a2;a3],M1,M2,M3)
xlabel('vinkel, grader')
ylabel('m/s^2')

figure()
errorbar(aksel_tid,error_tid)
hold on
errorbar(aksel_frekv,error_frekv)
errorbar(teoretisk,error_teoretisk)
ylabel('m/s^2')

function [aksel] = ac_plot(tw,fw,duration,n)
    figure()
    subplot(2,2,[3 4])
    plot(tw,fw,'o-') 
    xlabel('t (s)')
    ylabel('Frekvens (Hz)')

    n1 = n;
    delta_v = 1/duration;
    delta_T = 0.28;
    fm = fw(1:n1)
    f = fw(1);
    T = 21.1;
    c = 331.1 + 0.606*T;
    v = (1-f./fm)*c;
    delta_fm = delta_v/c*f;
    
    t = tw(1:n1)
    a = zeros(1,n1);
    for i = 1:n1-1
        dv = v(i+1)-v(i);
        dt = t(i+1) - t(i);
        a(i) = dv/dt
    end
    length(v)
    length(a)
    
    subplot(2,2,2)
    plot(tw(1:n-1),a(1:n-1),'o-')
    xlabel('t (s)')
    ylabel('Akselerasjon (m/s^2)')
    
    subplot(2,2,1)
    plot(tw(1:n),v(1:n),'o-')
    xlabel('t (s)')
    ylabel('Hastighet (m/s)')
  
    ass1 = delta_fm; 
    ass2 = delta_v; 
    ass3 = sqrt(delta_T^2 + delta_v^2);
    aksel = a
end






