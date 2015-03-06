function uk = inicond()
    global params
    
    switch params.inicond
        case 'turbulence'
            vor  = 100*(2*rand(params.nx,params.ny)-1);                  % random stuff
            vork = exp(-0.001*(params.Kx.^2+params.Ky.^2) ) .* fft2(vor); % smooth it
            uk = vor2u(vork);
        case 'meanflow'
            u = zeros(params.nx,params.ny,1:2);
            u(:,:,1) = 1;
            u(:,:,2) = 0;
            uk = coftxy_2d(u);
        otherwise
            error('Initial condition unkown...')
    end
end