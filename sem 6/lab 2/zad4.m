clc;
clear;

%% 
[file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
img = imread([path, file]);
% img_1 = imread('boat.bmp');
% img_2 = imread("motyl.bmp");
[X,Y,DIM] = size(img);
if DIM > 1
    img = rgb2gray(img);
end

[low_1,high_1,widmo_1] = low_high_pass_filter(img,1);
[low_2,high_2,widmo_2] = low_high_pass_filter(img,0.5);


inverted_img_high_1 = uint8(real(ifft2(ifftshift(widmo_1.*high_1))));
inverted_img_low_1 = uint8(real(ifft2(ifftshift(widmo_1.*low_1))));
inverted_img_high_2 = uint8(real(ifft2(ifftshift(widmo_2.*high_2))));
inverted_img_low_2 = uint8(real(ifft2(ifftshift(widmo_2.*low_2))));
widmo_1 = log(1+abs(widmo_1));
widmo_2 = log(1+abs(widmo_2));

img_pack_1 = {img,widmo_1,low_1,widmo_1.*low_1,inverted_img_low_1,widmo_2,low_2,widmo_2.*low_2,inverted_img_low_2};
img_pack_2 = {img,widmo_1,high_1,widmo_1.*high_1,inverted_img_high_1,widmo_2,high_2,widmo_2.*high_2,inverted_img_high_2};

error = plot_imgs(img_pack_1);
error = plot_imgs(img_pack_2);



%% Functions

function [lowpass_img, highpass_img,widmo] = low_high_pass_filter(img,scale)
    widmo = fftshift(fft2(img));
    [X,Y] = size(img);
    x_diff = 0:(X - 1);
    y_diff = 0:(Y - 1);
    idx = find(x_diff > X/2);
    x_diff(idx) = x_diff(idx) - X;
    idy = find(y_diff > Y/2);
    y_diff(idy) = y_diff(idy) - Y;
    [V, U] = meshgrid(y_diff, x_diff);
    D0=30;
    D = scale*sqrt(U.^2 + V.^2);
    lowpass_img =abs(ifftshift( double(D <=D0)));
    % Highpass
    D0=10;
    H =ifftshift( double(D <=D0));
    highpass_img=1-H;
end

%% Plotting
function error = plot_imgs(img_pack)
figure;
subplot(2,5,1);
imshow(img_pack{1},[]);
xlabel("Obraz Wejściowy");
subplot(2,5,2);
imshow(img_pack{2},[]);
xlabel("Widmo Mocy");
subplot(2,5,3);
imshow(img_pack{3},[]);
xlabel("Maska 1");
subplot(2,5,4);
imshow(img_pack{4},[]);
xlabel("Maska * Widmo");
subplot(2,5,5);
imshow(img_pack{5},[]);
xlabel("Wynik");
subplot(2,5,6);
imshow(img_pack{1},[]);
xlabel("Obraz Wejściowy");
subplot(2,5,7);
imshow(img_pack{6},[]);
xlabel("Widmo Mocy");
subplot(2,5,8);
imshow(img_pack{7},[]);
xlabel("Maska 1");
subplot(2,5,9);
imshow(img_pack{8},[]);
xlabel("Maska * Widmo");
subplot(2,5,10);
imshow(img_pack{9},[]);
xlabel("Wynik");
error =1;
end

