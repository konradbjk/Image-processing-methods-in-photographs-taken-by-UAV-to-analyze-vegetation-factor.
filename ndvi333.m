clear all;
clc;
%% Wczytanie zdjêcia wymaga Mapping Toolbox
file = 'C:\Users\kbuja\Downloads\Zdjêcia\dron\soko³ówgsd5.tif';
I = imread(file);
% [I R] = geotiffread(file);
outputdir = pwd;
%% Obliczanie NDVI
% NIR = im2double(I(:,:,4));
% red = im2double(I(:,:,1));
% tic, ndvi = (NIR - red) ./ (NIR + red); toc
%% Tworzenie szumu gausowskiego na zdjeciu
% J = imnoise(I,'gaussian',0, 0.01); 
% NIR2 = im2double(J(:,:,4));
% red2 = im2double(J(:,:,1));
% ndvi2 = (NIR2 - red2) ./ (NIR2 + red2);
%% Sprawdzenie czy wartoœci ndvi nie przekracaja zakresu -1 do 1
% NDVI_max= max(ndvi(:))
% NDVI_min= min(ndvi(:))
%% Wyswietlenie wynikow NDVI z szumem i bez
% figure 
% subplot(2,1,1)  
% imshow(ndvi,'DisplayRange',[-1 1])
% title('NDVI without the noise')
% subplot(2,1,2)  
% imshow(ndvi2,'DisplayRange',[-1 1])
% title('NDVI with the gaussian noise')
%% Rozci¹gniêcie NDVI do -100 do +100
% ndvi = floor(ndvi* 100);
%ndvi2 = floor(ndvi2* 100);
%% pokazanie rzek
% figure
% s_ndvi = int8(ndvi);
% s_ndvi_in=-1.*s_ndvi;
% imshow(s_ndvi_in,[50 80])
%% Zapis NDVI do UINT8
% ndvi2 = uint8(ndvi2); 
% ndvi = uint8(ndvi); 
% ndvi_g = mat2gray(ndvi);
%% Zapis NDVI do obrazow na dysku
% imwrite(ndvi, 'ndviBezSz.tif')
% imwrite(ndvi2, 'ndviZSz.tif')
%% Wyswietlanie rozszerzonych wartosci NDVI
% figure 
% subplot(2,1,1)
% imshow(ndvi)
% title('Extended NDVI without the noise')
% subplot(2,1,2)
% imshow(ndvi2)
% title('Extended NDVI with the gaussian noise')
%% Colormapa
% colormap jet;
% cmap = colormap;
%odwracanie colormapy
% cmap = flipud(cmap);
%% Colormapa NDVI
% figure
% subplot(2,1,1)
% imshow(ndvi_g), colormap(cmap)
% colorbar %('NDVI values',[0,0.01,0.02,0.1,0.2,0.3,0.4,0.5,0.6,1])
% subplot(2,1,2)
% histogram(ndvi_g)
%% DVI
% figure
% tic, dvi = NIR - red; toc
% dvi_max=max(dvi(:))
% dvi_min=min(dvi(:))
% dvi =floor(dvi*100);
% dvi = uint8(dvi);
% dvi_g=mat2gray(dvi);
% imshow(dvi_g), colormap(cmap)
% colorbar
%% RDVI
% figure 
% tic, rdvi = (NIR - red) ./ sqrt(NIR+red); toc
% rdvi_max=max(rdvi(:))
% rdvi_min=min(rdvi(:))
% rdvi = floor(rdvi*100);
% rdvi = uint8(rdvi);
% rdvi_g=mat2gray(rdvi);
% imshow(rdvi_g), colormap(cmap)
% colorbar
%% RVI
% figure
% tic, rvi=NIR ./ red; toc
% rvi_max=max(rvi(:))
% rvi_min=min(rvi(:))
% rvi= floor(rvi*100);
% rvi=uint8(rvi);
% rvi_g = mat2gray(rvi);
% imshow(rvi_g), colormap(cmap)
% colorbar
%% TVI
% figure
% tic, ndvi=max(ndvi,-0.5); toc
% ndvi_min=min(ndvi(:))
% tvi = sqrt(ndvi+0.5);
% tvi_max=max(tvi(:))
% tvi_min=min(tvi(:))
% tvi=floor(tvi*100);
% tvi=uint8(tvi);
% tvi_g=mat2gray(tvi);
% imshow(tvi_g), colormap(cmap)
% colorbar
%% TTVI
% figure
% tic, ttvi = sqrt(abs(ndvi+0.5)); toc
% ttvi_max=max(ttvi(:))
% ttvi_min=min(ttvi(:))
% ttvi=floor(ttvi*100);
% ttvi=uint8(ttvi);
% ttvi_g=mat2gray(ttvi);
% imshow(ttvi_g), colormap(cmap)
% colorbar
%% SAVI
% figure
% L=0.5;
% tic, savi=(NIR - red) ./ (NIR + red + L) .* (1+L); toc
% SAVI_max=max(savi(:))
% SAVI_min=min(savi(:))
% savi=floor(savi*100);
% savi=uint8(savi);
% savi_g=mat2gray(savi);
% imshow(savi_g), colormap(cmap)
% colorbar
%% MSAVI2
% figure
% tic, zmienna1=(2.*NIR+1).^2;
% zmienna2=sqrt(zmienna1-8.*(NIR-red));
% zmienna3=(2.*(NIR+1)-zmienna2);
% msavi2=0.5.*zmienna3;toc % 1.2 sec
% tic, msavi2=0.5*(2.*(NIR+1)-sqrt((2.*NIR+1).^2-8.*(NIR-red))); toc % 0.94 sec
% msavi2_max=max(msavi2(:))
% msavi2_min=min(msavi2(:))
% msavi2 = floor(msavi2*100);
% msavi2 = uint8(msavi2);
% msavi2_g = mat2gray(msavi2);
% imshow(msavi2_g), colormap(cmap)
% colorbar
%% IPVI
% figure
% tic, ipvi=NIR./(NIR+red); toc
% ipvi_min=min(ipvi(:))
% ipvi_max=max(ipvi(:))
% ipvi=floor(ipvi*100);
% ipvi=uint8(ipvi);
% ipvi_g=mat2gray(ipvi);
% imshow(ipvi_g), colormap(cmap)
% colorbar
%% IPVI na drugi sposob ( po wyliczeniu NDVI)
% tic, ipvi2=0.5.*(ndvi+1); toc
% ipvi2_min=min(ipvi2(:))
% ipvi2_max=max(ipvi2(:))
%% Zapis na dysku
% tiffdata = geotiffinfo(file);
% nazwa_wyjsciowa1 = [outputdir 'koncowe_zdjecie' '.tif'];  
% nazwa_wyjsciowa2 = [outputdir 'koncowe_zdjecie2' '.tif'];  
% geotiffwrite(nazwa_wyjsciowa1, ndvi, R, 'GeoKeyDirectoryTag', tiffdata.GeoTIFFTags.GeoKeyDirectoryTag);
% geotiffwrite(nazwa_wyjsciowa2, ndvi2, R, 'GeoKeyDirectoryTag', tiffdata.GeoTIFFTags.GeoKeyDirectoryTag);