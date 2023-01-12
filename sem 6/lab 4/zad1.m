clc
clear
%%
[file,path]=uigetfile('*.*', 'Select an image');
img = imread([path, file]);
[~,~,DIM] = size(img);
if DIM > 1
    img = rgb2gray(img);
end
img = imresize(img,[512,512],"bicubic");
% figure;
imshow(img);

mirror_image = crop_img(img,2);
% figure;
imshow(mirror_image);

mirrored_image = crop_img(img,2.5); % 2.5 MAX for triangle
imshow(mirrored_image);
% figure;
imshow(mirrored_image);

flipped_img = imrotate(img,45);
% figure;
imshow(flipped_img);

flipped_img2 = imtranslate(img,[0, 60],'FillValues',0);
% figure;
imshow(flipped_img2);

knn1 = crop_img(img,1.5);
knn1 = imtranslate(knn1,[0, -60],'FillValues',0);
knn2 = crop_img(img,1.3);
knn2 = imtranslate(knn2,[0, 60],'FillValues',0);


imwrite(img,"1_0.png");
imwrite(mirror_image,"1_1.png");
imwrite(mirrored_image,"1_2.png");
imwrite(flipped_img,"1_3.png");
imwrite(flipped_img2,"1_4.png");

imwrite(knn1,"1_5.png");
imwrite(knn2,"1_6.png");

%% 









