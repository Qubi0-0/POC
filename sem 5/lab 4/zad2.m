clc;clear;

[file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
img = double(imread([path, file]));
old_img=zeros(1,1,3);
new_pix=uint8(zeros(1,1,3));
[x,y] = size(img,1:2);
R=kwant(4);
G=kwant(4);
B=kwant(2);

for i = 1:x-1
    for j = 2:y-1
        old_img = img(i,j,:);
        new_pix(1,1,1) = findCol(old_img(1,1,1),R);
        new_pix(1,1,2) = findCol(old_img(1,1,2),G);
        new_pix(1,1,3) = findCol(old_img(1,1,3),B);
        img(i,j,:) = new_pix;
        quant_error = double(double(old_img) - double(new_pix));
        img(i,j+1,:) = uint16(img(i,j+1,:)) + (7/16.0).*quant_error(1,1,:);
        img(i+1,j-1,:) = uint16(img(i+1,j-1,:)) + (3/16.0).*quant_error(1,1,:);
        img(i+1,j,:) = uint16(img(i+1,j,:)) + (5/16.0).*quant_error(1,1,:);
        img(i+1,j+1,:) = uint16(img(i+1,j+1,:)) + (1/16.0).*quant_error(1,1,:);
    end
end
imwrite(uint8(img),"woman_fs.png");
%% Plotting
figure;
subplot(1,2,1);
imshow(uint8(img));
xlabel("Custom");
subplot(1,2,2);
imshow(img_otsu);
xlabel('Otsu');

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

function pix = findCol(pixel,n)
    for k=1:1:size(n,1)
         if(pixel<=((k)*256/size(n,1)))
            pix=n(k);
            break;
         end
    end
end

function calculateColors = kwant(n)
    len = 256/n;
    qEnd = len;
    start =1;
    calculateColors = zeros(n,1);
    for i=1:1:n
        calculateColors(i) = start+len/2-1;
        start = start + len;
        qEnd = qEnd + len;
    end
end