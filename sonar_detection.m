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
title('Sonar Detection: Convolved Signal(RecievedSignal * h)') 
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





filter = fft(h);
filter = fftshift(filter);
filter = filter / length(filter);
f = linspace(-Fs/2, Fs/2, length(filter));


convolved = fft(y);
convolved = fftshift(convolved);
convolved = convolved / length(convolved);
c = linspace(-Fs/2, Fs/2, length(convolved));


%plot impulse response in frequency domain
figure;
subplot(2,1,1)
plot(f,real(filter))
title('Matched Filter Response Spectrum - Real')
xlabel('Frequency (1/sec)')
ylabel('Amp')

subplot(2,1,2)
plot(f,imag(filter))
title('Matched Filter Response Spectrum - Imaginary')
xlabel('Frequency (1/sec)')
ylabel('Amp')


%plot convolved signal in frequency domain
figure;
subplot(2,1,1)
plot(c,real(convolved))
title('Convolved Signal Response Spectrum - Real')
xlabel('Frequency (1/sec)')
ylabel('Amp')

subplot(2,1,2)
plot(c,imag(convolved))
title('Convolved Signal Response Spectrum - Imaginary')
xlabel('Frequency (1/sec)')
ylabel('Amp')

end

