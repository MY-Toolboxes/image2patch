I = im2double(imread('cameraman.tif'));
M_patches = image2patches(I, 200, 200, 100, 100);
im = patches2image(M_patches, 256,256,  100, 100);
figure,imshow(im,[])

I = im2double(imread('cameraman.tif'));
M_patches = image2patches(I, 100, 100, 100, 100,'off');
im = patches2image(M_patches, 256,256,  100, 100,'off');
figure,imshow(im,[])

I=imread('sherlock.jpg');
M_patches = image2patches(I, 200, 200, 40, 50);
im = patches2image(M_patches, 640,960,  40, 50);
figure,imshow(uint8(im),[])

I=imread('sherlock.jpg');
M_patches = image2patches(I, 200, 200, 40, 50,'off');
im = patches2image(M_patches, 640,960,  40, 50,'off');
figure,imshow(uint8(im),[])