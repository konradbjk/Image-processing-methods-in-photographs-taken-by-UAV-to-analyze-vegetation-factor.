clear all;
clc;
%% Wczytanie zdjêcia wymaga Mapping Toolbox
% [I R] = geotiffread(file);
file = 'filepath\file_name.tif';
I = imread(file);
outputdir = pwd;
%% Obliczanie NDVI
NIR = im2double(I(:,:,4));
red = im2double(I(:,:,1));
tic, ndvi = (NIR - red) ./ (NIR + red); toc
%% Tworzenie szumu gausowskiego na zdjeciu
J = imnoise(I,'gaussian',0, 0.005); 
NIR2 = im2double(J(:,:,4));
red2 = im2double(J(:,:,1));
ndvi2 = (NIR2 - red2) ./ (NIR2 + red2);
%% Wyswietlenie wynikow NDVI z szumem i bez
J(:,:,4)=[];
I(:,:,4)=[];
figure 
subplot(1,2,1)  
imshow(I)
title('Obraz bez szumu')
subplot(1,2,2)  
imshow(J)
title('Obraz z szumem')
%% Mapa kolorów
colormap jet;
cmap = colormap;
% odwracanie mapy kolorów
cmap = flipud(cmap);
%% Rozci¹gniêcie NDVI do -100 do +100
ndvi = floor(ndvi* 100);
ndvi2 = floor(ndvi2* 100);
%% pokazanie rzek
figure
s_ndvi = int8(ndvi);
s_ndvi_in=-1.*s_ndvi;
imshow(s_ndvi_in,[10 60])
%% Zapis NDVI do UINT8
ndvi = uint8(ndvi); 
ndvi_g = mat2gray(ndvi);
ndvi2 = uint8(ndvi2); 
ndvi2_g = mat2gray(ndvi2);
%% Wyswietlanie rozszerzonych wartosci NDVI
% figure 
% subplot(1,2,1)  
imshow(ndvi_g), colormap(cmap)
title('NDVI')
colorbar
% subplot(1,2,2)  
% imshow(ndvi2_g), colormap(cmap)
% title('NDVI z szumem')