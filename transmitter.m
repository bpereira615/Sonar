%   Benjamin Hoertnagl-Pereira
%   bhoertn1@jhu.edu
%   
%   Signals and Systems
%   Project 2
%       Part 3

function [ x ] = transmitter(  )
%transmitter Converts the input message into a digital signal with noise
%   Detailed explanation goes here

Fs = 100;

% message, "i love signals"
msg = [0 1 1 0 1 0 0 1 0 0 1 0 0 0 0 0 0 1 1 0 1 1 0 0 0 1 1 0 1 1 1 1 0 1 1 1 0 1 1 0 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 0 0 1 1 1 0 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 0 1 1 1 0 1 1 0 1 1 1 0 0 1 1 0 0 0 0 1 0 1 1 0 1 1 0 0 0 1 1 1 0 0 1 1]; 
logic = 0:1/Fs:0.5;
len = length(msg) * (length(logic) + 1);



i = 1;
pos = 1;
x = zeros(1, len);


while i < length(msg) 
    if (msg(i) == 0)
        logic = -1 .* logic;
    end
    
    x(pos:pos+length(logic)-1) = logic;
    pos = pos + length(logic);
    i = i + 1;
end




%add random noise to signal
random = rand(1, length(x));
y = x + random;


%plot transmitted pure vs noisy, time domain
t = linspace(0, length(x) / Fs , length(x));
figure;
subplot(2,1,1)
plot(t, x, '-b')
title('Transmission: Pure Signal') 
xlabel('Time (sec)')
ylabel('Amp')

subplot(2,1,2)
plot(t, y, '-b')
title('Transmission: Noisy Signal') 
xlabel('Time (sec)')
ylabel('Amp')


%plot transmitted pure vs noisy, freq domain
x_fft = fft(x);
x_fft = fftshift(x_fft);
x_fft = x_fft / length(x_fft);
fx = linspace(-Fs/2, Fs/2, length(x_fft));

y_fft = fft(y);
y_fft = fftshift(y_fft);
y_fft = y_fft / length(y_fft);
fy = linspace(-Fs/2, Fs/2, length(y_fft));

figure;
subplot(2,2,1)
plot(fx,real(x_fft))
title('Transmission: Pure Signal, Freq Domain - Real')
xlabel('Frequency (1/sec)')
ylabel('Amp')

subplot(2,2,2)
plot(fx,imag(x_fft))
title('Transmission: Pure Signal, Freq Domain - Imaginary')
xlabel('Frequency (1/sec)')
ylabel('Amp')

subplot(2,2,3)
plot(fy,real(y_fft))
title('Transmission: Noisy Signal, Freq Domain - Real')
xlabel('Frequency (1/sec)')
ylabel('Amp')

subplot(2,2,4)
plot(fy,imag(y_fft))
title('Transmission: Noisy Signal, Freq Domain - Imaginary')
xlabel('Frequency (1/sec)')
ylabel('Amp')
end

