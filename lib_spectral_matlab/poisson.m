function uk = poisson(Sk)
%% uk = Poisson(Sk): solves poisson eqn in Fourier space by diving by K^2
% requires wavenumbers matrices params.Kx and params.Ky
    global params
    K = -(params.Kx.^2 + params.Ky.^2); % laplacian is division -|k|^2
    uk = zeros(size(Sk));
    uk(K<0) = Sk(K<0)./K(K<0);    
end
