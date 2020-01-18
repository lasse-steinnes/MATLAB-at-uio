%Målinger med KCl-krystall
% eventuelle usikkerheter i vinkel!

grad1 = [22,22.5,23,23.5,24,24.5,25,25.5,26,26.5,27,27.5,28,28.5,29,29.5,30,30.5];
intensitet1 = [mean([91,90]),mean([91,68]),mean([91,89]),mean([69,74]),mean([101,77]),mean([93,95,70]),mean([101,100]),mean([134,142]),mean([187,186]),mean([90,106]),mean([85,112]),mean([103,96]),mean([348,302]),mean([891,845]),mean([148,180]),mean([104,94]),mean([106,110]),mean([106,108])]/10; % 10 sekunder tellerate
d_theta = 0.1 % nøyaktighet
d2 = 401 %pm
theta = [28.5;26.0;58.5;52.5]/2 % to til
dlambda_n1 = d2.*cosd(theta(1:2)).*d_theta
dlambda_n2 = d2.*cosd(theta(3:4)).*d_theta


grad2 = [50,50.5,51,51.5,52,52.5,53,53.5,54,54.5,55,55.5,56,56.5,57,57.5,58,58.5,59,59.5,60];
intensitet2 = [mean([114,121]),mean([109,102]),mean([102,86]),mean([100,126]),mean([122,105]),mean([142,139,128]),mean([107,109,113,136]),mean([117,96]),mean([118,114]),mean([124,129]),mean([124,103]),mean([109,118]),mean([127,123]),mean([109,139]),mean([104,118]),mean([118,89]),mean([108,121]),mean([187,203]),mean([149,175]),mean([102,153,117]),mean([119,99])]/10; 
bakgrunn1 = mean(intensitet1(1:6));
bakgrunn2 = mean(intensitet2(1:5));
intensitet1 =  intensitet1 - bakgrunn1
intensitet2 = intensitet2 - bakgrunn2


plot(grad1,intensitet1,'.-')
xlabel('Vinkel [grader]') % FontSize 12
ylabel('Intensitet [fotoner/sek]')
figure()
plot(grad2,intensitet2,'.-')
xlabel('Vinkel [grader]')
ylabel('Intensitet [fotoner/sek]')



