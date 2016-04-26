function [ msg ] = receiver( x, h )
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

% i = 1;
% while i < length(digSig)
%     bits = digSig(i:i+7)
%     i = i + 7;
% end
    

msg = zeros(1,1);
    

end

