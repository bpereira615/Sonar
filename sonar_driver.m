Fs = 100;

%% Part 1 - Sonar Detection
distance = sonar_detection('ActiveSonar.mat');


%% Part 2 - Digital Message Reception

load('ReceivedSignal.mat');

%h, matchted filter for logical 1
h = fliplr(0:1/Fs:0.5);


msg=receiver(ReceivedSignal, h);