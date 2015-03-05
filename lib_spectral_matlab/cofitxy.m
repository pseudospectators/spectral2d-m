function f = cofitxy(fk)
%% f = cofitxy(fk): wrapper for symmetric ifft
    global params
    f = ifft2(fk,'symmetric');
end

