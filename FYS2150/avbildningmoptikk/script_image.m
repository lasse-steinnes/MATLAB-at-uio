
filepath='G:\laboppgave\';

[filename,filepath,FilterIndex] = uigetfile([filepath,'*.png']);
%filename='eksptest30007.png';

%image analysis
[m,v]=image_noise_analysis(filepath,filename)