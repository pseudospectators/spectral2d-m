function [nlk] = add_pressure(nlk)
%% [nlk] = add_pressure(nlk), adds the pressure gradient to the RHS of Navier-Stokes
% projects the whole RHS given in nlk
    global params
    % note this is not p in rotation formulation (i.e. the non-linear term
    % written as omega \times u)
    q = poisson( divergence_2d(nlk) );
    nlk(:,:,1) = nlk(:,:,1) - 1i*params.Kx.*q;
    nlk(:,:,2) = nlk(:,:,2) - 1i*params.Ky.*q;      
end
