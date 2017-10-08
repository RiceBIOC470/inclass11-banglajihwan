% Inclass11

% You can find a multilayered .tif file with some data on stem cells here:
% https://www.dropbox.com/s/83vjkkj3np4ehu3/011917-wntDose-esi017-RI_f0016.tif?dl=0

% 1. Find out (without reading  the entire file) -  (a) the size of the image in
% x and y, (b) the number of z-slices, (c) the number of time points, and (d) the number of
% channels.
file1 = ('011917-wntDose-esi017-RI_f0016.tif');
reader = bfGetReader(file1);
[reader.getSizeX, reader.getSizeY]
reader.getSizeZ
reader.getSizeT
reader.getSizeC
% 2. Write code which reads in all the channels from the 30th time point
% and displays them as a multicolor image.
zplane = 1;
chan1 = 1;
time = 30 ;
iplane1 = reader.getIndex (zplane-1, chan1-1, time-1) +1;

chan2 = 2;
iplane2 = reader.getIndex (zplane-1, chan2-1, time-1) +1;

img1 = bfGetPlane(reader, iplane1);
img2 = bfGetPlane(reader, iplane2);

img2show = cat(3, imadjust (img1), imadjust(img2), zeros(size(img1))); 
imshow(img2show); 
% 3. Use the images from part (2). In one of the channels, the membrane is
% prominently marked. Determine the best threshold and make a binary
% mask which marks the membranes and displays this mask. 
img_bw = img1 > 1200;
imshow(img_bw)
%not the best but acceptable

% 4. Run and display both an erosion and a dilation on your mask from part
% (3) with a structuring element which is a disk of radius 3. Explain the
% results.
imshow(imdilate(img_bw, strel('disk', 3))); 
imshow(imerode(img_bw, strel('disk', 3))); 
% dilate; every pixel is taken and dilated by a defined shape disk. 
% if the pixel is 1 the near by pixel is converted to 1 and this leads to
% dilation
%erode: if there is small pixel with value 0, it turns the nearby pixel to
%0. and so my mask looks almost all black. 