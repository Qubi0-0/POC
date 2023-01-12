clear;

% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
img = imread("img_008.bmp");
img_2 = imread("shrek_drzewa.png");
% RGB na HSV
hsv = rgb2hsv(img);
hsv_2 = rgb2hsv(img_2);
img_3 = hsv2rgb(hsv);
img_4 = hsv2rgb(hsv_2);
% Counting Colors
tic
rgb_colors = sum(find_rgb_colors(img,""),'all');
toc
tic
rgb_colors_2 = sum(find_rgb_colors(img_2,""),'all');
toc
tic
rgb_colors_3 = sum(find_rgb_colors(img_3,"normalized"),'all');
toc
tic
rgb_colors_4 = sum(find_rgb_colors(img_4,"normalized"),'all');
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
            fprintf("%s is incorrect!!!",target);
            break
        end
%         if result_img(uint16(r)+1,uint16(g)+1,uint16(b)+1) == 0
            result_img(uint16(r)+1,uint16(g)+1,uint16(b)+1) = 1;
%         end
    end
end

end


