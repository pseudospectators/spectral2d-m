function uk = dealias_2d(uk)
%% uk = dealias_2d(uk(:,:,1:2)) delete aliased modes
    uk(:,:,1) = dealias(uk(:,:,1));
    uk(:,:,2) = dealias(uk(:,:,2));
end
