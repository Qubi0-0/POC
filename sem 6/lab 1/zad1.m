clc;

%% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
img_butterfly = imread("monarch_512x512.bmp");
img_boat = imread("boat_512x512.bmp");
img_butterfly_grey = rgb2gray(img_butterfly);
img_boat_grey = rgb2gray(img_boat);


%% Plotting grey and color
% figure;
% subplot(2,2,1);
% imshow(img_butterfly);
% xlabel("1 obraz");
% subplot(2,2,2);
% imshow(img_boat);
% xlabel('2 obraz');
% subplot(2,2,3);
% imshow(img_butterfly_grey);
% xlabel('3 obraz');
% subplot(2,2,4);
% imshow(img_boat_grey);
% xlabel('4 obraz');


%% jamming

img_boat_1 = imnoise(img_boat, "salt & pepper", 0.01);
img_boat_2 = imnoise(img_boat, "salt & pepper", 0.02);
img_boat_5 = imnoise(img_boat, "salt & pepper", 0.15);

img_butterfly_1 = imnoise(img_butterfly, "salt & pepper", 0.01);
img_butterfly_2 = imnoise(img_butterfly, "salt & pepper", 0.02);
img_butterfly_5 = imnoise(img_butterfly, "salt & pepper", 0.15);

% imwrite(img_boat_1,'boat_1.png');
% imwrite(img_boat_3,'boat_3.png');
% imwrite(img_boat_5,'boat_15.png');
% 
% imwrite(img_butterfly_1,'butterfly_1.png');
% imwrite(img_butterfly_2,'butterfly_2.png');
% imwrite(img_butterfly_5,'butterfly_15.png');

%% Plotting color jam

figure;
subplot(3,4,1);
imshow(img_boat);
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_boat_1);
xlabel('obraz1 + 1%');
subplot(3,4,3);
imshow(img_boat_2);
xlabel('obraz1 + 2%');
subplot(3,4,4);
imshow(img_boat_5);
xlabel('obraz1 + 15%');
subplot(3,4,5);
imshow(img_butterfly);
xlabel('obraz2');
subplot(3,4,6);
imshow(img_butterfly_1);
xlabel('obraz2 + 1%');
subplot(3,4,7);
imshow(img_butterfly_2);
xlabel('obraz2 + 2%');
subplot(3,4,8);
imshow(img_butterfly_5);
xlabel('obraz2 + 15%');


%%
img_boat_grey_1 = imnoise(img_boat_grey, "salt & pepper", 0.01);
img_boat_grey_2 = imnoise(img_boat_grey, "salt & pepper", 0.02);
img_boat_grey_5 = imnoise(img_boat_grey, "salt & pepper", 0.15);

img_butterfly_grey_1 = imnoise(img_butterfly_grey, "salt & pepper", 0.01);
img_butterfly_grey_2 = imnoise(img_butterfly_grey, "salt & pepper", 0.02);
img_butterfly_grey_5 = imnoise(img_butterfly_grey, "salt & pepper", 0.15);

% imwrite(img_boat_grey_1,'boat_1_grey.png');
% imwrite(img_boat_grey_2,'boat_2_grey.png');
% imwrite(img_boat_grey_5,'boat_15_grey.png');
% imwrite(img_butterfly_grey_1,'butterfly_1_grey.png');
% imwrite(img_butterfly_grey_2,'butterfly_2_grey.png');
% imwrite(img_butterfly_grey_5,'butterfly_15_grey.png');

%% Plotting grey jam

figure;
subplot(3,4,1);
imshow(img_boat_grey);
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_boat_grey_1);
xlabel('obraz1 + 1%');
subplot(3,4,3);
imshow(img_boat_grey_2);
xlabel('obraz1 + 2%');
subplot(3,4,4);
imshow(img_boat_grey_5);
xlabel('obraz1 + 15%');
subplot(3,4,5);
imshow(img_butterfly_grey);
xlabel('obraz2');
subplot(3,4,6);
imshow(img_butterfly_grey_1);
xlabel('obraz2 + 1%');
subplot(3,4,7);
imshow(img_butterfly_grey_2);
xlabel('obraz2 + 2%');
subplot(3,4,8);
imshow(img_butterfly_grey_5);
xlabel('obraz2 + 15%');


