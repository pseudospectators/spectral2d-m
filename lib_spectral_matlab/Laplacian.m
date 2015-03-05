function [L] = Laplacian(field)
%% computes the laplacian of a given scalar vector field
% requires global params to contain a suitable matrix params.D2
    global params
    gy = (field*params.D2y');
    gx = (params.D2x*field);   
    L=gx+gy;
end