function uk = coftxy_2d(u)
%% uk = coftxy_2d(u)  FFT of the vector field
    global params
    uk(:,:,1) = fft2(u(:,:,1));
    uk(:,:,2) = fft2(u(:,:,2));
end
