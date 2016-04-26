function [ msg ] = receiver_fft( x, h )
%receiver_fft frequency domain matched filter technique, decoding message
%   Detailed explanation goes here



%ASCII mapping creation
asciiMap = containers.Map();

fileID = fopen('ascii.code');
line = fgetl(fileID);

while ischar(line)
   data = strsplit(line, ': ');
   asciiMap(data{2}) = data{1};
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

t = 50;
i = 1;
msg = zeros(1, length(y)/50 - 1);

while t < length(x)
    if x(t) > 0
        msg(i) = 1;
    else
        msg(i) = 0;
    end
    
    t = t + 50;
    i = i + 1;
end

%may need to check the very last bit outside of this
    if x(end) > 0
        msg(end) = 1;
    else
        msg(end) = 0;
    end

end

