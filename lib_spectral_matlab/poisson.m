function pk = poisson(Sk)
%% pk = Poisson(Sk): solves poisson eqn in Fourier space by diving by -K^2
% requires wavenumbers matrices params.Kx and params.Ky
    global params
    
    % laplacian is division -|k|^2
    K = -(params.Kx.^2 + params.Ky.^2); 
    K ( abs(K) < 1.0e-11 ) = 1;
    % to avoid a division by zero, we set the zeroth wavenumber to one.
    % this leaves it's respective Fourier coefficient unaltered, so the
    % zero mode of Sk is conserved. This way, Sk's zero mode implicitly
    % defined the zero mode of the result
    % Note that the zero mode is NOT uniquely defined: in a periodic
    % setting, the solution of Laplace's (or Poisson's) equation is only
    % defined up to a constant! You can freely overwrite the zero mode,
    % therefore.
    pk = Sk ./ K;
end
