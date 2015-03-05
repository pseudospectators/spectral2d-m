function uk = make_incompressible_2d(uk)
%% uk = make_incompressible_2d(uk) removes divergence
    global params
    p = poisson(  divergence(uk(:,:,1), uk(:,:,2))  );
    uk(:,:,1) = uk(:,:,1) - 1i*params.Kx.*p;
    uk(:,:,2) = uk(:,:,2) - 1i*params.Ky.*p;  
end
