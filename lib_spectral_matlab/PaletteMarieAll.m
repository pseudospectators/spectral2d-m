function PaletteMarie = PaletteMarieAll(Type,taille,limite_faible_fort,etalement_du_zero,blackmargin)

% PaletteMarie(Type,taille,limite_faible_fort,etalement_du_zero)
% Where Type is : 'Vorticity'

% Modified after discussion with Marie 14/02/2010
% Modified after discussion with Marie  3/11/2010

if strcmp(Type,'Pressure')
     color1=[0 0.5 1];     
     color2=[1 1 1];
     color3=[1 1 0];
     zero=[1 0 0];

     limite_basse = floor(taille/2*(1-limite_faible_fort));
     limite_haute = ceil(taille/2*(1+limite_faible_fort));

     zero_moins = floor((taille-etalement_du_zero)/2);
     zero_plus = ceil((taille + etalement_du_zero)/2);

PaletteMarie = [ linspace(blackmargin,1,limite_basse)'*color1; linspace(blackmargin^3,0.5,zero_moins-limite_basse)'*color2; ones(etalement_du_zero,1)*zero; linspace(0.5,1-blackmargin^3,limite_haute-zero_plus)'*color2; linspace(blackmargin,1,taille-limite_haute)'*color3 ];
end 


if strcmp(Type,'Streamfunction') % Also recommended for the velocity (3 nov 2010)
     color1=[0.5 0 1];
     color2=[1 1 1];
     color3=[1 0.8 0];
     zero=[0.0 1.0 0.5];

     limite_basse = floor(taille/2*(1-limite_faible_fort));
     limite_haute = ceil(taille/2*(1+limite_faible_fort));

     zero_moins = floor((taille-etalement_du_zero)/2);
     zero_plus = ceil((taille + etalement_du_zero)/2);

PaletteMarie = [ linspace(blackmargin,1,limite_basse)'*color1; linspace(blackmargin^3,0.5,zero_moins-limite_basse)'*color2; ones(etalement_du_zero,1)*zero; linspace(0.5,1-blackmargin^3,limite_haute-zero_plus)'*color2; linspace(blackmargin,1,taille-limite_haute)'*color3 ];
end 

%%
if strcmp(Type,'Velocity')
     color1=[1 1 0];
     color2=[1 1 1];
     color3=[1 0.5 0.5];
     zero=[0.5 1 0.5];

     limite_basse = floor(taille/2*(1-limite_faible_fort));
     limite_haute = ceil(taille/2*(1+limite_faible_fort));

     zero_moins = floor((taille-etalement_du_zero)/2);
     zero_plus = ceil((taille + etalement_du_zero)/2);

%      color1=[0 0.35 1];     %light blue
%      color2=[1 1 1];       %white
%      color3=[1 0.4 0.45];   %light red
%      zero=[255 222 17]/255;
% 
%      limite_basse = floor(taille/2*(1-limite_faible_fort));
%      limite_haute = ceil(taille/2*(1+limite_faible_fort));
% 
%      zero_moins = floor((taille-etalement_du_zero)/2);
%      zero_plus = ceil((taille + etalement_du_zero)/2);

PaletteMarie = [ linspace(blackmargin,1,limite_basse)'*color1; linspace(blackmargin^3,0.5,zero_moins-limite_basse)'*color2; ones(etalement_du_zero,1)*zero; linspace(0.5,1-blackmargin^3,limite_haute-zero_plus)'*color2; linspace(blackmargin,1,taille-limite_haute)'*color3 ];
end 
%%

if strcmp(Type,'Vorticity')
     color1=[0 0.5 1];     %light blue
     color2=[1 1 1];       %white
     color3=[1 0.5 0.5];   %light red

     zero=[255 222 17]/255;
%      zero=[1 1 1]
%      zero=[1 1 0];
     

     limite_basse = floor(taille/2*(1-limite_faible_fort));
     limite_haute = ceil(taille/2*(1+limite_faible_fort));

     zero_moins = floor((taille-etalement_du_zero)/2);
     zero_plus = ceil((taille + etalement_du_zero)/2);

PaletteMarie = [ linspace(blackmargin,1,limite_basse)'*color1;...
                 linspace(blackmargin^3,0.5,zero_moins-limite_basse)'*color2;...
                 ones(etalement_du_zero,1)*zero;...
                 linspace(0.5,1-blackmargin^3,limite_haute-zero_plus)'*color2;...
                 linspace(blackmargin,1,taille-limite_haute)'*color3 ];
end      
%%

if strcmp(Type,'CWT_MORLET_CUM')
     color1=[0 0 1];
     color2=[0 1 0];
     color3=[1 0 0];
     zero=[1 1 0];


     limite_basse = floor(taille/2*(1-limite_faible_fort));
     limite_haute = ceil(taille/2*(1+limite_faible_fort));

     zero_moins = floor((taille-etalement_du_zero)/2);
     zero_plus = ceil((taille + etalement_du_zero)/2);

PaletteMarie = 1 - [ abs(linspace(-1,1,2*limite_haute))'*[1 1 1] ].^2;

%PaletteMarie = [ abs(linspace(-1,1,2*limite_haute))'*color3 ].^1  + [ abs(linspace(-1,1,2*limite_haute))'*color2 ].^2 ;
end
