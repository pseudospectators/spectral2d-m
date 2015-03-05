function [gxk gyk]=gradient( uk )
%% [gxk gyk]=gradient( uk )
% [gxk gyk] gradient in Fourier space
global params
gxk = 1i*params.Kx.*uk;
gyk = 1i*params.Ky.*uk;
end