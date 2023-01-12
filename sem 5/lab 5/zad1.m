clc;clear;

% [file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
% img = imread([path, file]);
img_chosen = imread("taniec.jpg");
img = rgb2gray(img_chosen);
% imshow(img_chosen);
MIN = 20;
MAX = 240;
THRESHOLD = 100;
img(1,1) = 255;
img(end,end) = 0;

% 
% img_2 = stretch(img,THRESHOLD,MIN,MAX);
% img_2 = local_stretch(img,64,64);
% imshow(img_2);
% flat_img = histeq(img_2);



% img_streched = stretch(img,THRESHOLD,0,255);
% min_streched = min(min(img_streched));
% max_streched = max(max(img_streched));
% img_streched_v2 = local_stretch(img,128,128);
% min_streched_v2 = min(min(img_streched_v2));
% max_streched_v2 = max(max(img_streched_v2));
img_clahe = adapthisteq(img,"Range","full");
img_clahe = adapthisteq(img,"NumTiles");

mini = min(min(img_clahe));
maxi = max(max(img_clahe));

[k1,k2,k3,k4] = ratings(img_clahe);

%% Saving
% imwrite(img_streched,'streched.png');
% imwrite(img_streched_v2,'streched_local.png');
% imwrite(img_HE,'he.png');
imwrite(img_clahe,"clahe/clahe.png");

% figure;
% imhist(img);
% figure;
% imhist(img_HE);
% figure;
% imhist(img_streched_v2);
figure;
imhist(img_clahe);


%% Plotting
% figure;
% subplot(3,3,1);
% imshow(img);
% xlabel("Template")
% subplot(3,3,2);
% imshow(img_2);
% xlabel("Changed");
% subplot(3,3,3);
% imshow(flat_img);
% xlabel('Flattened');
% subplot(3,3,5);
% imhist(img_2);
% xlabel("Changed hist");
% subplot(3,3,6);
% imhist(flat_img);
% xlabel('Flattened hist');
% subplot(3,3,4);
% imhist(img);
% xlabel('Template hist');

%% Functions

function result = stretch(img,threshold,A,B)
    hist = imhist(img);
    placement = find(hist'>threshold);
    min_img = placement(1);
    max_img = placement(size(placement,2));
    img = double(img);
    a = (B-A)/(max_img - min_img);
    b = (a*min_img);
    result = a*img - b + A;
    result = uint8(result);
end

function result = local_stretch(img,x_parts,y_parts)
    [x,y] = size(img);
    result = uint8(zeros(x,y));
    x_divider = 1:floor(x/x_parts);
    y_divider = 1:floor(y/y_parts);
    for i=1:y_parts
        for j=1:x_parts
            result(x_divider,y_divider) = stretch(img(x_divider,y_divider),0,0,255);
            x_divider = x_divider + floor(x/x_parts);
        end
        x_divider = 1:floor(x/x_parts); 
        y_divider = y_divider + floor(y/y_parts);
    end
end




function [k1,k2,k3,k4]=ratings(x)
Nx = size(x,1);
Ny = size(x,2);
Lmin = double(min(min(x)));
Lmax = double(max(max(x)));
Lsr = sum(sum(x,2),1)/(Nx*Ny);
k1 = (Lmax-Lmin)/255;
k2 = (Lmax-Lmin)/Lsr;
k3 = (Lmax-Lmin)/(Lmax+Lmin);
k4 = 4*sum(sum((x-Lsr).^2,2),1)/(255^2*Nx*Ny);
end