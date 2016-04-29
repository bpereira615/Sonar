%   Benjamin Hoertnagl-Pereira
%   bhoertn1@jhu.edu
%   
%   Signals and Systems
%   Project 2
%       Part 2.2

function [ msg ] = receiver_fft( x, h )
%receiver_fft frequency domain matched filter technique, decoding message
%   Details in report.


%sampling frequency
Fs = 100;

%ASCII mapping creation
asciiMap = containers.Map();

fileID = fopen('ascii.code');
line = fgetl(fileID);

while ischar(line)
   data = strsplit(line, ': ');
   asciiMap(data{2}) = data(1);
   line = fgetl(fileID);
end

%find padding for convolution
convLength = length(conv(x,h));

%convert input and frequency response to frequency domain
x_fft = fft(x, convLength);
h_fft = fft(h, convLength);

%convolution
y_fft = x_fft .* h_fft;

%convert back to time domain
y = ifft(y_fft);



%plotting
%{

% plot matched filter and input in frequency domain 
x_fft = fftshift(x_fft);
x_fft = x_fft / length(x_fft);
fx = linspace(-Fs/2, Fs/2, length(x_fft));
 
h_fft = fftshift(h_fft);
h_fft = h_fft / length(h_fft);
fh = linspace(-Fs/2, Fs/2, length(h_fft));
 
figure;
subplot(2,2,1)
plot(fh,real(h_fft))
title('Matched Filter, Freq Domain - Real')
xlabel('Frequency (Hz)')
ylabel('Amp')
 
subplot(2,2,2)
plot(fh,imag(h_fft))
title('Matched Filter, Freq Domain - Imaginary')
xlabel('Frequency (Hz)')
ylabel('Amp')
 
subplot(2,2,3)
plot(fx,real(x_fft))
title('Received Signal, Freq Domain - Real')
xlabel('Frequency (Hz)')
ylabel('Amp')
 
subplot(2,2,4)
plot(fx,imag(x_fft))
title('Received Signal, Freq Domain - Imaginary')
xlabel('Frequency (Hz)')
ylabel('Amp')

%}


% add random noise to signal
%{
random = rand(1, length(y));
y = y + random;
%}




%look at the index of the end of h sampling
interval = length(h) - 1;
t = interval;
i = 1;
digSig = zeros(1, length(y)/(length(h) - 1));

while t <= length(y)
    if y(t) > 0
        digSig(i) = 1;
    else
        digSig(i) = 0;
    end
    
    t = t + interval;
    i = i + 1;
end


%convert digSig into character array to be parsed
binaryStr = '';
i = 1;
while i <= length(digSig)
    binaryStr = strcat(binaryStr, int2str(digSig(i)));
    i = i + 1;
end

msg = '';
i = 1;
b = 1;
while i < length(digSig)
    msg = strcat(msg, asciiMap(binaryStr(i:i+7)));
    i = i + 8;
end


end

