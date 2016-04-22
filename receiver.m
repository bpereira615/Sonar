function [ msg ] = receiver( x, h )
%receiver matched filter technique, decoding message
%   Detailed explanation goes here


y = conv(x, h);

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

