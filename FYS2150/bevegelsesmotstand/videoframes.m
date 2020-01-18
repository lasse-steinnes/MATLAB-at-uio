% Ã…pne videofil og vis tidssteg for tidssteg
vr = VideoReader('stålkuleiolje.mp4')
currAxes = axes;
currAxes.XLim=[0 1];
i = 0;
while hasFrame(vr)
    i=i+1;
    vidFrame = readFrame(vr);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    fprintf('%d\n',i)
    pause;
end


% Duration: 7.5090
% FrameRate: 30.0224 (frame per second)
% avstand mellom hovedlinjer: 25.5 mm 

