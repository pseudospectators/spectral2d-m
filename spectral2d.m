function main
close all
clear all
clc
addpath(genpath('./lib_spectral_matlab/'))

n=128

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global params
params.nx           = n;
params.ny           = n;
params.Lx            = 2*pi;
params.Ly            = 2*pi;
params.eta          = 1e-0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.nu           = 1/1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.dt_fixed     = 0; % fix the time step or adapt it dynamically
params.CFL          = 0.25;
params.T_end        = 8.0;
params.dt           = min(1e-1,params.eta);
params.iplot        = 40; % plot every iplot time steps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.x            = params.Lx*(0:params.nx-1)/(params.nx);
params.y            = params.Ly*(0:params.ny-1)/(params.ny); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.mask         = zeros(params.nx,params.ny);
params.dealias      = zeros(params.nx,params.ny);
params.us           = zeros(params.nx,params.ny,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
geometry_wavenumbers;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = params.X;
Y = params.Y;

% initial condition
uk = inicond();
% create the mask
create_mask();

time = 0;
it   = 1;

while (time<params.T_end)
   % deterimne time step 
   params.dt = min( dt_CFL(cofitxy_2d(uk)), params.eta);
   
   if (params.T_end-time<params.dt)
       params.dt = params.T_end-time;
   end
   
   [uk] = RK2(uk,params.dt);

   time = time + params.dt;
   it = it+1;

   if (mod(it,params.iplot)==0)       
    figure(3)
    clf
    vor = cofitxy(vorticity_2d(uk));
    pcolor(X,Y,vor);
    colormap(PaletteMarieAll('Vorticity',600,0.3,5,0.25));
    scale = 1.0;
    axis equal
    c = scale*max ( min(min(abs(vor))), max(max(vor)) );
    caxis([-c c])
    colorbar
    shading interp    
   end
end 

save all.mat
end




function [nlk]=nonlinear(uk)
    % computes the non-linear terms + penalization in Fourier space.    
    global params

    u = cofitxy_2d(uk);
    vork = vorticity_2d(uk);
    vor = cofitxy(vork);
    
    nlk(:,:,1) = fft2( +vor .* u(:,:,2) - (params.mask/params.eta).*(u(:,:,1)-params.us(:,:,1))  );
    nlk(:,:,2) = fft2( -vor .* u(:,:,1) - (params.mask/params.eta).*(u(:,:,2)-params.us(:,:,2))  );
    
    nlk = dealias_2d(nlk);
    nlk = add_pressure(nlk);
    
    if (max(max(max(abs(u))))>1e3)
        error('diverged..')
    end
end





function [uk_new] = RK2(uk,dt)
    global params
  
    % compute non-linear terms
    nlk = nonlinear(uk);

    % exponential factor:
    vis = cal_vis_2d(dt);
    uk_new = vis.*(uk + dt*nlk );
    uk_new = dealias_2d(uk_new);
    
    nlk2 = nonlinear(uk_new);

    uk_new = vis.*uk + 0.5*dt*(nlk.*vis + nlk2);
    
    % Dealiasing
    uk_new = dealias_2d(uk_new);
        
    
end






function uk = inicond()
    global params
    vor  = 100*(2*rand(params.nx,params.ny)-1);                  % random stuff
    vork = exp(-0.001*(params.Kx.^2+params.Ky.^2) ) .* fft2(vor); % smooth it
    uk = vor2u(vork);
end




function create_mask
    global params

    params.mask=zeros(params.nx,params.ny);

end


