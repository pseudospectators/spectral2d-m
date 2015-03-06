
function create_mask
    global params
    switch params.mask_geometry
        case ('cylinder')
            params.mask=zeros(params.nx,params.ny);
            x0 = 0.5*params.Lx;
            y0 = 0.5*params.Ly;
            R = sqrt( (params.X-x0).^2 + (params.Y-y0).^2);
            params.mask( R<0.5 ) = 1;
        otherwise
            params.mask=zeros(params.nx,params.ny);
    end
end