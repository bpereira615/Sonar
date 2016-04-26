function [ ascii_out ] = read_ascii( binary )
%read_ascii converts a binary vector into a string of ascii characters
%   Detailed explanation goes here

asciiMap = containers.Map();

fileID = fopen('ascii.code');
line = fgetl(fileID);

i = 1;
while ischar(line)
   data = strsplit(line, ': ');
   asciiMap(data{2}) = data{1};
   line = fgetl(fileID);
   i = i + 1;
end

end

