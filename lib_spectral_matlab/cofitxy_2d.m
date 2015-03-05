function u = cofitxy_2d(uk)
    global params
    u(:,:,1) = cofitxy(uk(:,:,1));
    u(:,:,2) = cofitxy(uk(:,:,2));
end
