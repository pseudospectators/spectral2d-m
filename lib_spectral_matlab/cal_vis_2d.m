function vis=cal_vis_2d( dt )
%% vis=cal_vis_2d( dt )
% vis(:,:,1:2) integrating factor in Fourier space
global params
vis(:,:,1) = exp( -params.nu*dt*(params.Kx.^2+params.Ky.^2) );
    vis(:,:,2) = vis(:,:,1);
end