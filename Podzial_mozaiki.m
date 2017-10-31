clear all;
clc;
%% Wczytanie mozaiki
file = 'file_path\file_name.tif';
I = imread(file);
%% Podzielenie zdjêcia
% Wartoœci do których iterujê zmienne i oraz j s¹ zwi¹zane z rozmiarem
% zdjêcia bazowego, dla innych zdjêæ po wczytaniu obrazu do I nale¿y
% skorygowaæ te wartoœci
for i = 1:7 
    start2 = 0;
    for j = 1:5
       eval(sprintf('zdj_%d_%d = I(start+1:round(i*1000), start2+1:round(j*1000), :);', i, j));
       eval(sprintf('imwrite(zdj_%d_%d,''zdj_tiff_%d_%d.tif'');', i, j, i, j));
       start2=1000*j;
    end
    start=1000*i;
end