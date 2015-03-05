function [nlk] = add_pressure(nlk)
%% [nlk] = add_pressure(nlk), adds the pressure gradient to the RHS of Navier-Stokes
% projects the whole RHS given in nlk
    global params
    q = poisson( divergence(nlk(:,:,1),nlk(:,:,2)) ); % note this is not p in rotation formulation.
    nlk(:,:,1) = nlk(:,:,1) - 1i*params.Kx.*q;
    nlk(:,:,2) = nlk(:,:,2) - 1i*params.Ky.*q;      
end
