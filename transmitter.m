function [ x ] = transmitter( msg )
%transmitter Converts the input message into a digital signal with noise
%   Detailed explanation goes here

Fs = 100;

% message, "i love signals"
msg = [0 1 1 0 1 0 0 1 0 0 1 0 0 0 0 0 0 1 1 0 1 1 0 0 0 1 1 0 1 1 1 1 0 1 1 1 0 1 1 0 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 0 0 1 1 1 0 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 0 1 1 1 0 1 1 0 1 1 1 0 0 1 1 0 0 0 0 1 0 1 1 0 1 1 0 0 0 1 1 1 0 0 1 1]; 
len = length(msg) * Fs;

i = 1;
x = zeros(len);
logic = 0:1/Fs:0.5;
while i <= length(msg) 
    if (msg(i) == 0)
        logic = -1 .* logic;
    end
    
    x(i:i+length(logic)-1) = logic;
    i = i + 1;
end

end

