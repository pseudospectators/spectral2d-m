
function create_mask(time)
    global params
    switch params.mask_geometry
        case ('cylinder')
            params.mask=zeros(params.nx,params.ny);
            params.us  =zeros(params.nx,params.ny,2);
            x0 = 0.5*params.Lx;
            y0 = 0.5*params.Ly;
            R = sqrt( (params.X-x0).^2 + (params.Y-y0).^2);
            params.mask( R<0.5 ) = 1;
            
        case ('moving_cylinder')
            % smooth mask function for a cylinder, moving sinusoidally
            params.mask=zeros(params.nx,params.ny);            
            params.us  =zeros(params.nx,params.ny,2);
            x0 = 0.5*params.Lx+sin(time)*0.25*params.Lx;
            ux0 = 0.25*params.Lx*cos(time);
            y0 = 0.5*params.Ly;
            params.us(:,:,1) = ux0;
            
            % signed distance function:
            R0 = 0.5;
            C_smooth = 1;
            R = sqrt( (params.X-x0).^2 + (params.Y-y0).^2) - R0;
            h = C_smooth * max(params.dx,params.dy);
            params.mask (R<-h) = 1; %inside
            params.mask (R>+h) = 0; %outside
            params.mask (R>=-h&R<=+h) = 0.5*(1+cos((R(R>=-h&R<=+h)+h)*pi/(2*h))  );
            
        otherwise
            params.mask=zeros(params.nx,params.ny);            
            params.us  =zeros(params.nx,params.ny,1:2);
    end
end