function geometry_wavenumbers
%% defines mesh and wavenumber vectors, given params.x and params.y
    global params
    params.dx           = params.x(2)-params.x(1);
    params.dy           = params.y(2)-params.y(1);
    [params.X params.Y] = meshgrid(params.x,params.y);
    params.X            = params.X';
    params.Y            = params.Y';
    % create wavenumber matrices (global)
%     params.kx             = (2*pi/params.Lx)*[0:(params.nx/2-1) (-params.nx/2):(-1)]; % Vector of wavenumbers
%     params.ky             = (2*pi/params.Ly)*[0:(params.ny/2-1) (-params.ny/2):(-1)]; % Vector of wavenumbers
    
    params.kx             = fmodes(params.nx,params.Lx);
    params.ky             = fmodes(params.ny,params.Ly);
    
    [params.Kx,params.Ky] = meshgrid(params.kx,params.ky);
    params.Kx             = params.Kx';
    params.Ky             = params.Ky';
end
