clc;clear;

% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
% % img = imread("img_008.bmp");
img = imread("shrek_drzewa.png");


% quantization
rgb_colors_full = sum(find_rgb_colors(img,""),'all');
img_8 = quantize_rgb(img,2,2,2);
rgb_colors_8 = sum(find_rgb_colors(img_8,""),'all');
img_64 = quantize_rgb(img,4,4,4);
rgb_colors_64 = sum(find_rgb_colors(img_64,""),'all');
img_128 = quantize_rgb(img,4,6,4);
rgb_colors_128 = sum(find_rgb_colors(img_128,""),'all');
img_256 = quantize_rgb(img,6,6,6);
rgb_colors_256 = sum(find_rgb_colors(img_256,""),'all');

imwrite(img,"photos/img.png")
imwrite(img_8,"photos/img8.png");
imwrite(img_64,"photos/img64.png");
imwrite(img_128,"photos/img128.png");
imwrite(img_256,"photos/img256.png");

psnr_8 = psnr(img_8,img);
psnr_64 = psnr(img_64,img);
psnr_128 = psnr(img_128,img);
psnr_256 = psnr(img_256,img);

%% Plotting
figure;
subplot(1,5,2);
imshow(img_8);
xlabel("8 barw");
subplot(1,5,1);
imshow(img);
xlabel('oryginał');
subplot(1,5,3);
imshow(img_64);
xlabel('64 barwy');
subplot(1,5,4);
imshow(img_128);
xlabel('128 barw');
subplot(1,5,5);
imshow(img_256);
xlabel('256 barw');


% imwrite(result,"quantized.png");
    
%% Functions
function result_img = find_rgb_colors(A,target)

    result_img = zeros(256,256,256);
    
    [y, x, z] = size(A);

    for i = 1:1:y
        for j = 1:1:x
            if target == ""
            r = A(i,j,1);
            g = A(i,j,2);
            b = A(i,j,3);
            elseif target == "normalized"
            r = A(i,j,1)*256;
            g = A(i,j,2)*256;
            b = A(i,j,3)*256;
            else
                fprintf("%s is incorrect",target);
            end
            result_img(uint16(r)+1,uint16(g)+1,uint16(b)+1) = 1;
        end
    end
end

function result_img = quantize_rgb(img, r, g, b)
    [x,y,z] = size(img);
    result_img = zeros(x,y,z, 'uint8');
    red_div = 256/r;
    green_div = 256/g;
    blue_div = 256/b;
    
    for i = 1:1:x
        for j = 1:1:y
            result_img(i,j,1) = uint8(floor(double(img(i,j,1))/red_div)*red_div + red_div/2);
            result_img(i,j,2) = uint8(floor(double(img(i,j,2))/green_div)*green_div + green_div/2);
            result_img(i,j,3) = uint8(floor(double(img(i,j,3))/blue_div)*blue_div + blue_div/2);
        end
    end
end