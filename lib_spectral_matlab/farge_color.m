function farge_color
%% sets farge's color table for current plot, symmetric axis
c = caxis;
colormap(PaletteMarieAll('Vorticity',600,0.3,5,0.25));
caxis([-max(abs(c)) max(abs(c))])
end