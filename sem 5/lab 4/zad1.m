clc;clear;

[file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
img = imread([path, file]);
imwrite(img,"malpa.png");
% raw_img = uint8(img);
T = graythresh(img);
T = 255*T;
dither_img = dither(img);
img_otsu = imbinarize(double(img),T);
[x,y] = size(img);
old_img = zeros(x,y);
new_pix = zeros(x,y);
for i = 2:x-1
    for j = 2:y-1
        old_img(i,j) = img(i,j);
        if(old_img(i,j)  > T)
            new_pix(i,j) = 255;
        else
            new_pix(i,j) = 0;
        end
        img(i,j) = new_pix(i,j);
        quant_error = old_img(i,j) - new_pix(i,j);
        img(i+1,j) = img(i+1,j) + (7/16)*quant_error;       
        img(i-1,j+1) = img(i-1,j+1) + (3/16)*quant_error;
        img(i,j+1) = img(i,j+1) + (5/16)*quant_error;
        img(i+1,j+1) = img(i+1,j+1) + (1/16)*quant_error;
    end
end
imwrite(uint8(img),"malpa_fs.png");
% imwrite(uint8(img),"lenna_fs.png");
imwrite((img_otsu),"malpa_otsu.png");
% imwrite((img_otsu),"lenna_otsu.png");
imshow(img);
imwrite(dither_img,"dither.png");