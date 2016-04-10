function [ distance ] = sonar_detection( filename1, filename2 )
%sonar_detection - determines distance of object based on ping response
%   The function simulates an LTI matched filter system with impulse 
%   response related to ping. It convolves a received signal with this
%   impulse response and determines the distance from the receiver based
%   on the elapsed time after the return ping.


%load .mat file
load(filename1);
load(filename2);

%sample frequency
Fs = 100;

%impulse response - flip and shift signal
h = [zeros(size(SonarPing)) , fliplr(SonarPing)];

%convolution
y = conv(ReceivedSignal, h);
t = linspace(0, length(y) / Fs , length(y));

%plot convolved, time domain
figure;
plot(t, y, '-b')
title('sonar_detection: Convolved (RecievedSignal * h)') 
xlabel('Time (sec)')
ylabel('Amp')

%find maximum value
index = 1;
maxIndex = 1;
maxVal = 0;
for val = y
    if (val > maxVal) 
        maxVal = val;
        maxIndex = index;
    end
    
    index = index + 1;
end

%compute distance
%NOTE:  1) highest value at end of ping, must subtract ping length
%       2) signal travels to object and back, must divide by 2
tTotal = (maxIndex - length(SonarPing)) * 0.5 / Fs ;

%speed of sound in water, 5000 feet / sec 
speedSound = 5000;

distance = tTotal * speedSound;





freq = fft(SonarPing);
yfreq = fft(y);

figure;
tfreq = 1:30;
plot(tfreq, freq);

figure;
yt = 1:length(yfreq);
plot(yt, yfreq);

end

