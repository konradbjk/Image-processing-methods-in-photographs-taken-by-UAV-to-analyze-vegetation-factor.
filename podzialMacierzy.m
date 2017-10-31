file = 'C:\Users\kbuja\Downloads\Zdjêcia\dron\soko³ówgsd5.tif';
%I = imread(file);
%% Colormapa
colormap jet;
cmap = colormap;
% odwracanie colormapy
cmap = flipud(cmap);
start = 0;

for i = 1:7
    start2 = 0;
    for j = 1:9
       eval(sprintf('zdj_%d_%d = I(start+1:round(i*3000), start2+1:round(j*4000), :);', i, j));
       eval(sprintf('NIR_%d_%d = im2double(zdj_%d_%d(:,:,4));', i, j, i, j));
       eval(sprintf('red_%d_%d = im2double(zdj_%d_%d(:,:,1));', i, j, i, j));
       eval(sprintf('ndvi_%d_%d = (NIR_%d_%d - red_%d_%d) ./ (NIR_%d_%d + red_%d_%d);', i, j, i, j, i, j, i, j, i, j));
       eval(sprintf('ndvi_%d_%d = floor(ndvi_%d_%d* 100);', i, j, i, j));
       eval(sprintf('ndvi_%d_%d = uint8(ndvi_%d_%d);', i, j, i, j));
       eval(sprintf('ndvi_g_%d_%d=mat2gray(ndvi_%d_%d);', i, j, i, j));
       % eval(sprintf('imshow(ndvi_g_%d_%d), colormap(cmap);', i, j));  % to wyswietla colormape poprawnie 
       eval(sprintf('imwrite(ndvi_g_%d_%d,''obraz_ndvi2_%d_%d.png'');', i, j, i, j));
       start2=4000*j;
    end
    start=3000*i;
end
