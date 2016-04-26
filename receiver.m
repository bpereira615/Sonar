function [ digSig ] = receiver( x, h )
%receiver matched filter technique, decoding message
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


y = conv(x, h);

t = 50;
i = 1;
digSig = zeros(1, length(y)/50 - 1);

while t < length(x)
    if x(t) > 0
        digSig(i) = 1;
    else
        digSig(i) = 0;
    end
    
    t = t + 50;
    i = i + 1;
end

%may need to check the very last bit outside of this
    if x(end) > 0
        digSig(end) = 1;
    else
        digSig(end) = 0;
    end

i = 1;
while i < length(digSig)
    bits = digSig(i:i+7)
    i = i + 7;
end
    
    

end

