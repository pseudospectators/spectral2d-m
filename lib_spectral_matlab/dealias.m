function uk = dealias(uk)
%% uk = Dealias(uk) delete aliased modes
% requires wavenumbers params.Kx
global params

kx_trunc = (2/3)*max(params.kx);
ky_trunc = (2/3)*max(params.ky);

if (max(max(params.dealias))==0)
    for ix=1:params.nx
        for iy=1:params.ny
            if ((params.Kx(ix,iy)^2 / kx_trunc^2) + (params.Ky(ix,iy)^2 / ky_trunc^2) >= 1)
                params.dealias(ix,iy) = 0;
            else
                params.dealias(ix,iy) = 1;
            end
        end
    end
end

uk = uk.*params.dealias;
end
