function [nlk]=nonlinear(time,uk)
    %% computes the non-linear terms + penalization in Fourier space.    
    % you can also add explicit laplacian (explicit diffusion) if you
    % want to use higher order time stepping (maybe RK4) without
    % integrating factor
    global params
    
    if strcmp(params.moving_obstacle,'yes')
        create_mask(time);
    end

    % compute velocity in phys space
    u    = cofitxy_2d(uk);
    % compute vorticity (for the nonlinear term)
    vork = vorticity_2d(uk);
    vor  = cofitxy(vork);
    
    % compute nonlinear terms
    nlk(:,:,1) = fft2( +vor .* u(:,:,2) - (params.mask/params.eta).*(u(:,:,1)-params.us(:,:,1))  );
    nlk(:,:,2) = fft2( -vor .* u(:,:,1) - (params.mask/params.eta).*(u(:,:,2)-params.us(:,:,2))  );
    
    % add explicit diffusion terms (if you use different time stepping
    % schemes)
    if strcmp(params.explicit_diffusion,'yes')
        nlk(:,:,1) = nlk(:,:,1) - params.nu *( (params.Kx.^2+params.Ky.^2).*uk(:,:,1) );
        nlk(:,:,2) = nlk(:,:,2) - params.nu *( (params.Kx.^2+params.Ky.^2).*uk(:,:,2) );
    end
    
    % sponge term, if active
    if strcmp(params.vorticity_sponge,'yes')
        vor = vor.*params.masksponge;
        vortk = fft2(vor);
        nlk = nlk - vor2u(vortk);
    end
    
    % make the rhs incompressible
    nlk = add_pressure(nlk);
    
    % delete aliased modes
    nlk = dealias_2d(nlk);    
    
    % emergency brake
    if (max(max(max(abs(u))))>1e3)
        error('diverged..')
    end
end