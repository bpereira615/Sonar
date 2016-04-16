Fs = 100;

%% Part 1 - Sonar Detection
distance = sonar_detection('ActiveSonar.mat');


%% Part 2 - Digital Message Reception

load('ReceivedSignal.mat');

%h, matchted filter for logical 1 (negative for logical 0)
h = 0:1/Fs:0.5;
%flip and shift ramp function to get response
h = [zeros(size(h)), fliplr(h)];

msg=receiver(ReceivedSignal, h);