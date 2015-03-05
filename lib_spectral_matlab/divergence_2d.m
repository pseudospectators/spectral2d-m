function d = divergence_2d(uk)
%% div = Divergence_2d(uk) computes divergence in Fourier space
    global params
    d = 1i*params.Kx.*uk(:,:,1) + 1i*params.Ky.*uk(:,:,2);
end
