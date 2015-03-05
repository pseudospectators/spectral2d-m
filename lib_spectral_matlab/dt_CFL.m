function dt = dt_CFL(u)
%% dt = dt_CFL( u(:,:,1:2) ) returns the time step allowed by the CFL condition
% requires params.CFL, params.dx
    global params
    umax = max(max( sqrt(u(:,:,1).^2+u(:,:,2).^2)));
    if (umax>1e-7)
        dt = params.CFL *params.dx / umax;
    else
        dt = 1e-3;
    end
end