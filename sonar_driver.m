%   Benjamin Hoertnagl-Pereira
%   bhoertn1@jhu.edu
%   
%   Signals and Systems
%   Project 2



%% Part 1 - Sonar Detection
distance = sonar_detection('ActiveSonar.mat');


%% Part 2 - Digital Message Reception

%load received digital signal
load('ReceivedSignal.mat');

%sampling frequency
Fs = 100;

%h, matchted filter for logical 1
h = fliplr(0:1/Fs:0.5);


msg=receiver(ReceivedSignal, h);
msg_fft=receiver_fft(ReceivedSignal, h);

%check that messages are the same
isequal(msg, msg_fft);


%% Part 3 - Digital Message Transmission

x = transmitter();
personal_msg = receiver_fft(x, h);