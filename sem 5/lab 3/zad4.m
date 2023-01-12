clc;clear;

% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
% img = imread("img_008.bmp");
img = imread("shrek_drzewa.png");
img = rgb2hsv(img);

% quantization
rgb_colors_full = sum(find_hsv_colors(img),'all');
img_8 = quantize_hsv(img,2,2,2,0);
rgb_colors_8 = sum(find_hsv_colors(img_8),'all');
img_64 = quantize_hsv(img,4,4,4,0);
rgb_colors_64 = sum(find_hsv_colors(img_64),'all');
img_128 = quantize_hsv(img,4,6,4,0);
rgb_colors_128 = sum(find_hsv_colors(img_128),'all');
img_256 = quantize_hsv(img,10,5,5,6);
rgb_colors_256 = sum(find_hsv_colors(img_256),'all');


img = hsv2rgb(img);
psnr_8 = psnr(img_8,img);
psnr_64 = psnr(img_64,img);
psnr_128 = psnr(img_128,img);
psnr_256 = psnr(img_256,img);


imwrite(img,"photos/img.png")
imwrite(img_8,"photos/img8.png");
imwrite(img_64,"photos/img64.png");
imwrite(img_128,"photos/img128.png");
imwrite(img_256,"photos/img256.png");
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



%% Functions
function result_img = find_hsv_colors(img)

    result_img = zeros(1700,256,256);
    [x,y,z] = size(img);
   
    for i=1:1:x
        for j=1:1:y
            hue = round(img(i,j,1)*1700);
            sat = round(img(i,j,2)*256);
            val = round(img(i,j,3)*256);
            result_img(uint16(hue)+1,uint16(sat)+1,uint16(val)+1) = 1;
        end
    end
end

function result_img = quantize_hsv(img, h, s, v, chroma)
[x,y,z] = size(img);
result_img = zeros(x,y,z);
h_div = 1/h;
s_div = 1/s;
v_div = 1/v;
if chroma ~= 0
    chroma_div = 1/chroma;
end
for i = 1:1:x
    for j = 1:1:y
        if img(i,j,2) < 0.1 && chroma ~= 0 
            result_img(i,j,1) = 0;
            result_img(i,j,2) = 0;
            result_img(i,j,3) = floor(img(i,j,3)/chroma_div) * (chroma_div) + (chroma_div/2);
        else
            result_img(i,j,1) = floor(img(i,j,1)/h_div) * (h_div) + (h_div/2);
            result_img(i,j,2) = floor(img(i,j,2)/s_div) * (s_div) + (s_div/2);
            result_img(i,j,3) = floor(img(i,j,3)/v_div) * (v_div) + (v_div/2);
        end
        if result_img(i,j,1) >= 1
            result_img(i,j,1) = floor(0.9/h_div) * (h_div) + (h_div/2);
        end
        if result_img(i,j,2) >= 1
            result_img(i,j,2) = floor(0.9/s_div) * (s_div) + (s_div/2);
        end
        if result_img(i,j,3) >= 1
            result_img(i,j,3) = floor(0.9/v_div) * (v_div) + (v_div/2);
        end
         if result_img(i,j,1) <= (h_div/2)
            result_img(i,j,1) = (h_div/2);
        end
        if result_img(i,j,2) <= (s_div/2)
            result_img(i,j,2) = (s_div/2);
        end
        if result_img(i,j,3) <= (v_div/2)
            result_img(i,j,3) = (v_div/2);
        end
    end
end
result_img = round(abs(hsv2rgb(result_img)),3,'significant');
end


