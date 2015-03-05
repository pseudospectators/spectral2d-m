function uk = vor2u(vork)
    global params
    stream = poisson(vork);
    uk(:,:,1) = -1i*params.Ky.*stream;
    uk(:,:,2) = +1i*params.Kx.*stream;
end