originalImage = imread('a.tif');
sE = strel('square', 3); %Structural element' i 3*3 l�k kare belirledik
erosionImage = imerode(originalImage,sE); %G�r�nt�ye structural element ile erosion' a u�ratt�k.
result = originalImage - erosionImage;
subplot(1,2,1), imshow(originalImage), title('Original Image');
subplot(1,2,2), imshow(result), title('Image After Boundary Extraction');

