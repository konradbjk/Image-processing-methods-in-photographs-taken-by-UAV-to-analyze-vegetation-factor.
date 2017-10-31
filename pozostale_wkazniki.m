clear all;
clc;
%% Wczytanie zdjêcia wymaga Mapping Toolbox
% [I R] = geotiffread(file);
file = 'Obrazy/zdj_tiff_2_4.tif';
I = imread(file);
outputdir = pwd;
%% Obliczanie NDVI
NIR = im2double(I(:,:,4));
red = im2double(I(:,:,1));
tic, ndvi = (NIR - red) ./ (NIR + red); toc
%% Sprawdzenie czy wartoœci ndvi nie przekracaja zakresu -1 do 1
NDVI_max= max(ndvi(:))
NDVI_min= min(ndvi(:))
%% Mapa kolorów
colormap jet;
cmap = colormap;
% odwracanie mapy kolorów
cmap = flipud(cmap);
%% DVI
figure
tic, dvi = NIR - red; toc
dvi_max=max(dvi(:))
dvi_min=min(dvi(:))
% dvi =floor(dvi*100);
% dvi = uint8(dvi);
% dvi_g=mat2gray(dvi);
%imshow(dvi_g), colormap(cmap)
histogram(dvi)
title('DVI')
% colorbar
%% RDVI
figure 
tic, rdvi = (NIR - red) ./ sqrt(NIR+red); toc
rdvi_max=max(rdvi(:))
rdvi_min=min(rdvi(:))
% rdvi = floor(rdvi*100);
% rdvi = uint8(rdvi);
% rdvi_g=mat2gray(rdvi);
% imshow(rdvi_g), colormap(cmap)
histogram(rdvi)
title('RDVI')
% colorbar
%% RVI
figure
tic, rvi=NIR ./ red; toc
rvi_max=max(rvi(:))
rvi_min=min(rvi(:))
% rvi= floor(rvi*100);
% rvi=uint8(rvi);
% rvi_g = mat2gray(rvi);
% imshow(rvi_g), colormap(cmap)
histogram(rvi)
title('RVI')
% colorbar
%% TVI
% Nale¿y pamiêtaæ i¿ operacja sqrt() nie zadzia³a na zmiennych typu uint8
figure
tic,
ndvi=max(ndvi,-0.5); 
ndvi_min=min(ndvi(:));
tvi = sqrt(ndvi+0.5);toc
tvi_max=max(tvi(:))
tvi_min=min(tvi(:))
% tvi=floor(tvi*100);
% tvi=uint8(tvi);
% tvi_g=mat2gray(tvi);
% imshow(tvi_g), colormap(cmap)
histogram(tvi)
title('TVI')
% colorbar
%% TTVI
% Nale¿y pamiêtaæ i¿ operacja sqrt() nie zadzia³a na zmiennych typu uint8
figure
tic, ttvi = sqrt(abs(ndvi+0.5)); toc
ttvi_max=max(ttvi(:))
ttvi_min=min(ttvi(:))
% ttvi=floor(ttvi*100);
% ttvi=uint8(ttvi);
% ttvi_g=mat2gray(ttvi);
% imshow(ttvi_g), colormap(cmap)
histogram(ttvi)
title('TTVI')
% colorbar
%% SAVI
figure
L=0.5;
tic, savi=(NIR - red) ./ (NIR + red + L) .* (1+L); toc
SAVI_max=max(savi(:))
SAVI_min=min(savi(:))
% savi=floor(savi*100);
% savi=uint8(savi);
% savi_g=mat2gray(savi);
% imshow(savi_g), colormap(cmap)
histogram(savi)
title('SAVI dla L=0.5')
% colorbar
%% SAVI L=1
figure
L=1;
tic, savi2=(NIR - red) ./ (NIR + red + L) .* (1+L); toc
SAVI_max2=max(savi2(:))
SAVI_min2=min(savi2(:))
% savi2=floor(savi2*100);
% savi2=uint8(savi2);
% savi_g2=mat2gray(savi2);
% imshow(savi_g2), colormap(cmap)
histogram(savi)
title('SAVI dla L=1')
% colorbar
% %% MSAVI2
% figure
% tic, msavi=0.5*(2.*(NIR+1)-sqrt((2.*NIR+1).^2-8.*(NIR-red))); toc
% msavi_max=max(msavi(:))
% msavi_min=min(msavi(:))
% msavi = floor(msavi*100);
% msavi = uint8(msavi);
% msavi_g = mat2gray(msavi);
% imshow(msavi_g), colormap(cmap)
% histogram(msavi_g)
% title('MSAVI')
% % colorbar
%% IPVI
figure
tic, ipvi=NIR./(NIR+red); toc
ipvi_min=min(ipvi(:))
ipvi_max=max(ipvi(:))
% ipvi=floor(ipvi*100);
% ipvi=uint8(ipvi);
% ipvi_g=mat2gray(ipvi);
% imshow(ipvi_g), colormap(cmap)
histogram(ipvi)
title('IPVI')
% colorbar
%% IPVI na drugi sposob ( po wyliczeniu NDVI)
% tic, ipvi2=0.5.*(ndvi+1); toc
% ipvi2_min=min(ipvi2(:))
% ipvi2_max=max(ipvi2(:))
%% Zapis na dysku w momencie u¿ywania geotiffread do wczytania obrazu
% tiffdata = geotiffinfo(file);
% nazwa_wyjsciowa1 = [outputdir 'koncowe_zdjecie' '.tif'];  
% geotiffwrite(nazwa_wyjsciowa1, ndvi, R, 'GeoKeyDirectoryTag', tiffdata.GeoTIFFTags.GeoKeyDirectoryTag);
