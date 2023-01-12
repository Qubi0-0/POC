clc; clear;close; 

[file,path]=uigetfile({'*.BMP';'*.png'}, 'Select an image');
img = imread([path, file]);
% img = imread("morze.png");
% img = rgb2gray(img);


mask = ones(7,7);

maska = [-1 -1 -1; -1 8 -1; -1 -1 -1]; %klasyczny górnoprzepustowy


img = imnoise(img,"gaussian",0.02);
filtered_img = linear_filtering(img,mask);
filtered_img = linear_filtering(filtered_img,maska);
imshow(filtered_img,[]);


%% Functions 

function result_img = linear_filtering(img, mask_mat)
    mask_mat = double(mask_mat); img = double(img)/255;
    [X,Y] = size(img);   
    [X_mask,Y_mask] = size(mask_mat);   
    result_img = zeros(X,Y);           
    spectrum = floor(X_mask/2);
    for i =1+spectrum:1:(X-spectrum)
        for j =1+spectrum:1:(Y-spectrum)
            outcome = (mask_mat.*img(i-spectrum:i+spectrum, j-spectrum:j+spectrum));
            result_img(i,j) = sum(outcome(:));
        end
    end
    result_img = result_img*255;
    result_img = result_img(spectrum*2:end-spectrum*2,spectrum*2:end-spectrum*2);
end
