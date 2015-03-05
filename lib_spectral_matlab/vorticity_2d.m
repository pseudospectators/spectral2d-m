function vork = vorticity_2d(uk)
%% vork = Vorticity_2d(uk)
    global params
    vork = 1i*params.Kx.*uk(:,:,2)  - 1i*params.Ky.*uk(:,:,1);
end
