clear all;
clc;
%% Wczytanie mozaiki
file = 'file_path\file_name.tif';
I = imread(file);
%% Podzielenie zdj�cia
% Warto�ci do kt�rych iteruj� zmienne i oraz j s� zwi�zane z rozmiarem
% zdj�cia bazowego, dla innych zdj�� po wczytaniu obrazu do I nale�y
% skorygowa� te warto�ci
for i = 1:7 
    start2 = 0;
    for j = 1:5
       eval(sprintf('zdj_%d_%d = I(start+1:round(i*1000), start2+1:round(j*1000), :);', i, j));
       eval(sprintf('imwrite(zdj_%d_%d,''zdj_tiff_%d_%d.tif'');', i, j, i, j));
       start2=1000*j;
    end
    start=1000*i;
end