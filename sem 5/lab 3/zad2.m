clear;

% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
img = imread("img_008.bmp");
img_2 = imread("shrek_drzewa.png");
hsv = rgb2hsv(img);
hsv_2 = rgb2hsv(img_2);
tic
hsv_amount = sum(find_hsv_colors(hsv),'all');
toc
tic
hsv_amount_2 = sum(find_hsv_colors(hsv_2),'all');
toc



%% Plotting
figure;
subplot(1,2,1);
imshow(img);
xlabel("1 obraz");
subplot(1,2,2);
imshow(img_2);
xlabel('2 obraz');

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