function [gx, gy] = MyGradient(field)
%% computes the gradient of a scalar field using finite differences
% requires global.params to contain a suitable matrix params.D1
    global params    
    gx = (params.D1x*field);
    gy = (field*params.D1y');  
end
