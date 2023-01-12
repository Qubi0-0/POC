clc;clear;

raw_img_path = 'cfa_2.png';
color_img_path = 'srgb_2.png';


raw_img = imread(raw_img_path);  %upload raw img
color_img = imread(color_img_path);  %upload color img
    
% d1 = demosaic(raw_img,'gbrg');    %using demosaic function for each matrice combination
% d2 = demosaic(raw_img,'grbg');
d3 = demosaic(raw_img,'bggr');
% d4 = demosaic(raw_img,'rggb');

figure(); %plotting results
title('Bayer Matrice');
% subplot (2,3,1); imshow(raw_img(80:180,90:190)); xlabel('raw img');
% subplot (2,3,2); imshow(d1(80:180,90:190,:)); xlabel('gbrg');
% subplot (2,3,3); imshow(d2(80:180,90:190,:)); xlabel('grbg');
% subplot (2,3,4); imshow(color_img(80:180,90:190,:)); xlabel('template - GT')
subplot (2,3,5); imshow(d3(80:180,90:190,:)); xlabel('bggr');
% % subplot (2,3,6); imshow(d4(80:180,90:190,:)); xlabel('rggb');

% imwrite(d3, 'demosaic.png'); %saving correct result in file

[PSNR] = psnr(d3, color_img) %PSNR check
