function [ msg ] = receiver( x, h )
%receiver matched filter technique, decoding message
%   Detailed explanation goes here

logic1 = h;
logic0 = -1.*h;

y1 = conv(x, logic1);
y0 = conv(x, logic0);

msg = zeros(size(x));

%first 51 indices are just zero, start in correct position
curr = 52;
i = 1;
while curr < length(y1)
    abs(y1)
    abs(y0)
    if (abs(y1) > abs(y0))
        msg(i) = 1;
    end
    
    curr = curr + (0.5 * 100);
end

end

