%   Benjamin Hoertnagl-Pereira
%   bhoertn1@jhu.edu
%   
%   Signals and Systems
%   Project 2
%       Part 1-3


Fs = 100;

%% Part 1 - Sonar Detection
distance = sonar_detection('ActiveSonar.mat');


%% Part 2 - Digital Message Reception

load('ReceivedSignal.mat');

%h, matchted filter for logical 1
h = fliplr(0:1/Fs:0.5);


msg=receiver(ReceivedSignal, h);
mst_fft=receiver_fft(ReceivedSignal, h);

%x = transmitter();
%personal_msg = receiver(x, h);