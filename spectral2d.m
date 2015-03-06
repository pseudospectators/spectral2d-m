function main
close all
clear all
clc
global params
addpath(genpath('./lib_spectral_matlab/'))

%---------------------------
% here, all case-specific options are hidden:
%---------------------------
PARAMS_turbulent_cylinder;

% initialie grid, wavenumbers, etc
geometry_wavenumbers;

% initial condition
uk = inicond();

% create the mask
create_mask();

time = 0;
it   = 1;

while (time<params.T_end)
   % determine time step 
   params.dt = min( [dt_CFL(cofitxy_2d(uk)), params.eta, dt_TIME(time,params.T_end)] );
   
   % advance fluid in time
   [uk] = RK2(uk,params.dt);

   time = time + params.dt;
   it = it+1;

   % plot if time to do so
   if (mod(it,params.iplot)==0)
       figure(3)
       clf
       vor = cofitxy(vorticity_2d(uk));
       pcolor(params.X,params.Y,vor);
       colormap(PaletteMarieAll('Vorticity',600,0.3,5,0.25));
       scale = 1.0;
       axis equal
       c = scale*max ( min(min(abs(vor))), max(max(vor)) );
       caxis([-c c])
       colorbar
       shading interp
   end
end 

% save data to disk so you can have a look at it
save all.mat
end




function [uk_new] = RK2(uk,dt)
    global params
  
    % compute non-linear terms
    nlk = nonlinear(uk);

    % integrating factor:
    vis = cal_vis_2d(dt);
    uk_new = vis.*(uk + dt*nlk );
    uk_new = dealias_2d(uk_new);
    
    % compute non-linear terms at new time level
    nlk2 = nonlinear(uk_new);

    % advance to final velocity
    uk_new = vis.*uk + 0.5*dt*(nlk.*vis + nlk2);
    
    % Dealiasing
    uk_new = dealias_2d(uk_new);
end