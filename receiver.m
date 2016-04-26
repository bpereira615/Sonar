%   Benjamin Hoertnagl-Pereira
%   bhoertn1@jhu.edu
%   
%   Signals and Systems
%   Project 2
%       Part 2.1

function [ msg ] = receiver( x, h )
%receiver matched filter technique, decoding message
%   Detailed explanation goes here



%ASCII mapping creation
asciiMap = containers.Map();

fileID = fopen('ascii.code');
line = fgetl(fileID);

i = 1;
while ischar(line)
   data = strsplit(line, ': ');
   asciiMap(data{2}) = data{1};
%    if i == 1
%     asciiMap(data{2}) = '_';
%    end
   line = fgetl(fileID);
   i = 0;
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

