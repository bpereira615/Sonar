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


msg = zeros(1,1);

end

