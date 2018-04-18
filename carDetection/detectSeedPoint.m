clear all
close all
clc

rgb = imread('im1.jpg');
filename = 'im1.jpg'; %Dosya ismini almam�z i�in bunu da girmeliyiz.

[filepath,name,ext] = fileparts(filename);

if(name == 'im1') % resim1 i�in
[k,m] = size(rgb);

rgbgray = rgb2gray(rgb);
figure, imshow(rgb);

d = imdistline;
delete(d);

gray_image = rgb2gray(rgb);
imshow(gray_image);

rgb = rgb2hsv(rgb); %image lara pre-processing uygulad�k.
rgb = imsharpen(rgb);

% Tekerlekleri bulmak i�in
[centers, radii] = imfindcircles(rgb,[8 13], 'ObjectPolarity','dark', ...
          'Sensitivity',0.875,'Method','twostage');

h = viscircles(centers,radii);

%Buldu�u tekerle�in koordinatlar�n� al
a = centers(1,1);
b = centers(1,2);
a = ceil(a);
b = ceil(b);

% Tekerle�in yakla��k 32 pixel �st�n� seed point ata
b = b - 32;


figure, imshow(hsv2rgb(rgb), []), hold all
    poly = regionGrowing(rgbgray,[b,a],17); % Seed point' i ve threshold de�erini g�nder
    plot(poly(:,1), poly(:,2), 'LineWidth', 2);

end

if(name == 'im2') % resim2 i�in
[k,m] = size(rgb);

rgbgray = rgb2gray(rgb);
figure, imshow(rgb);

d = imdistline;
delete(d);

gray_image = rgb2gray(rgb);
imshow(gray_image);

rgb = rgb2hsv(rgb);

rgb = imsharpen(rgb);


[centers, radii] = imfindcircles(rgb,[16 23], 'ObjectPolarity','dark', ...
          'Sensitivity',0.92,'Method','twostage');

h = viscircles(centers,radii);

a = centers(1,1);
b = centers(1,2);
a = ceil(a);
b = ceil(b);
b = b - 32;

figure, imshow(hsv2rgb(rgb), []), hold all
    poly = regionGrowing(rgbgray,[b,a],54);
    plot(poly(:,1), poly(:,2), 'LineWidth', 2);

end

if(name == 'im3') % resim3 i�in
[k,m] = size(rgb);

rgbgray = rgb2gray(rgb);
figure, imshow(rgb);

d = imdistline;
delete(d);

gray_image = rgb2gray(rgb);
imshow(gray_image);

rgb = rgb2hsv(rgb);

rgb = imsharpen(rgb);


[centers, radii] = imfindcircles(rgb,[8 12], 'ObjectPolarity','dark', ...
          'Sensitivity',0.89,'Method','twostage');

h = viscircles(centers,radii);

a = centers(2,1);
b = centers(2,2);
a = ceil(a);
b = ceil(b);
b = b - 32;


figure, imshow(hsv2rgb(rgb), []), hold all
    poly = regionGrowing(rgbgray,[b,a],20);
    plot(poly(:,1), poly(:,2), 'LineWidth', 2);
    

end

if(name == 'im4') % resim4 i�in
[k,m] = size(rgb);

rgbgray = rgb2gray(rgb);
figure, imshow(rgb);

d = imdistline;
delete(d);

gray_image = rgb2gray(rgb);
imshow(gray_image);

rgb = rgb2hsv(rgb);

rgb = imsharpen(rgb);


[centers, radii] = imfindcircles(rgb,[13 20], 'ObjectPolarity','dark', ...
          'Sensitivity',0.90,'Method','twostage');

h = viscircles(centers,radii);

a = centers(2,1);
b = centers(2,2);
c = centers(1,1);
d = centers(1,2);
c = ceil(c);
d = ceil(d);
d = d - 32;
a = ceil(a);
b = ceil(b);
b = b - 32;


figure, imshow(hsv2rgb(rgb), []), hold all
    poly = regionGrowing(rgbgray,[b,a],38);
    plot(poly(:,1), poly(:,2), 'LineWidth', 2);
    
figure, imshow(hsv2rgb(rgb), []), hold all
    poly = regionGrowing(rgbgray,[d,c],24);
    plot(poly(:,1), poly(:,2), 'LineWidth', 2);
    

end

