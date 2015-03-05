function gradk=gradient_2d( uk )
%% gradk=gradient_2d( uk )
% gradk(:,:,1:2) gradient in Fourier space
global params
gradk(:,:,1) = 1i*params.Kx.*uk;
gradk(:,:,2) = 1i*params.Ky.*uk;
end