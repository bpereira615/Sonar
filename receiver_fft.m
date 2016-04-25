function [ ] = receiver_fft( x, h )
%receiver_fft frequency domain matched filter technique, decoding message
%   Detailed explanation goes here

%find padding for convolution
convLength = length(conv(x,h));

%convert input and frequency response to frequency domain
x_fft = fft(x, convLength);
h_fft = fft(h, convLength);

%convolution
y_fft = x_fft .* h_fft;

%convert back to time domain
y = ifft(y_fft);
end

