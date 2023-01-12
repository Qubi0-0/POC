clc;

%% Uploading Image
% [file,path]=uigetfile({'*.png';'*.BMP'}, 'Select an image');
% img = imread([path, file]);
img_1 = imread("boat_512x512.bmp");
img_2 = imread("monarch_512x512.bmp");
img_1_grey = rgb2gray(img_1);
img_2_grey = rgb2gray(img_2);
img_butterfly = imread("butterfly_2.png");
img_boat = imread("boat_3.png");
img_butterfly_grey = rgb2gray(img_butterfly);
img_boat_grey = rgb2gray(img_boat);

img = rgb2gray(imread('boat_3.png'));

% boat_3_lum_2 = lum_filter(img,3,2);
% boat_3_lum_3 = lum_filter(img,3,3);
% boat_3_mediana = median_filter(img,3);
% % disp(psnr(img_1_grey,boat_3_lum_2));
% % disp(psnr(img_1_grey,boat_3_lum_3));
% % disp(psnr(img_1_grey,boat_3_mediana));
% img = rgb2gray(imread('boat_15.png'));
% boat_5_lum_2 = lum_filter(img,3,2);
% boat_5_lum_3 = lum_filter(img,3,3);
% boat_5_mediana = median_filter(img,3);
% disp(psnr(img_1_grey,boat_5_lum_2));
% disp(psnr(img_1_grey,boat_5_lum_3));
% disp(psnr(img_1_grey,boat_5_mediana));

% boat_median_1 = median_filter(img_boat_1,3);
% boat_median_2 = median_filter(img_boat_2,3);
% boat_median_10 = median_filter(img_boat_10,3);

% butterfly_median_1 = median_filter(img_butterfly_1,3);
% butterfly_median_2 = median_filter(img_butterfly_2,3);
% butterfly_median_10 = median_filter(img_butterfly_10,3);

% boat_vmf_1 = vmf_filter(img_boat_1,3);
% boat_vmf_1_1 = vmf_filter(boat_vmf_1,3);
% boat_vmf_2 = vmf_filter(img_boat_2,3);
% boat_vmf_2_2 = vmf_filter(boat_vmf_2,3);
% boat_vmf_10 = vmf_filter(img_boat_10,3);
% boat_vmf_10_10 = vmf_filter(boat_vmf_10,3);
% 
% butterfly_vmf_1 = vmf_filter(img_butterfly_1,3);
% butterfly_vmf_2 = vmf_filter(img_butterfly_2,3);
% butterfly_vmf_10 = vmf_filter(img_butterfly_10,3);
% butterfly_vmf_1_1 = vmf_filter(butterfly_vmf_1,3);
% butterfly_vmf_2_2 = vmf_filter(butterfly_vmf_2,3);
% butterfly_vmf_10_10 = vmf_filter(butterfly_vmf_10,3);


%% Plotting median - color
psnr_median_img_1_3 = psnr(img_1(4:end-3),img_boat(4:end-3));
psnr_median_img_2_1 = psnr(img_2(4:end-3),img_butterfly(4:end-3));

boat_median_3_col = median_filter(img_boat, 3);

psnr_median_1 = psnr(img_1(4:end-3),boat_median_3_col(4:end-3));

boat_median_5_col = median_filter(img_boat, 5);

psnr_median_5 = psnr(img_1(4:end-3),boat_median_5_col(4:end-3));

boat_median_7_col = median_filter(img_boat, 7);

psnr_median_7 = psnr(img_1(4:end-3),boat_median_7_col(4:end-3));

butterfly_median_3_col = median_filter(img_butterfly,3);

psnr_median_1_b = psnr(img_1(4:end-3),butterfly_median_3_col(4:end-3));

butterfly_median_5_col = median_filter(img_butterfly,5);

psnr_median_5_b = psnr(img_1(4:end-3),butterfly_median_5_col(4:end-3));

butterfly_median_7_col = median_filter(img_butterfly,7);
psnr_median_7_b = psnr(img_1(4:end-3),butterfly_median_7_col(4:end-3));


figure;
subplot(3,5,1);
imshow(img_1(300:450,300:450,1:end));
xlabel("obraz1");
subplot(3,5,2);
imshow(img_boat(300:450,300:450,1:end));
xlabel('obraz1 + 3% PSNR: 20.3582');
subplot(3,5,3);
imshow(boat_median_3_col(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.6547');
subplot(3,5,4);
imshow(boat_median_5_col(300:450,300:450,1:end));
xlabel('mediana 5x5 PSNR: 23.8766');
subplot(3,5,5);
imshow(boat_median_7_col(300:450,300:450,1:end));
xlabel('mediana 7x7 PSNR: 22.0804');
subplot(3,5,6);
imshow(img_2(300:450,300:450,1:end));
xlabel('obraz2');
subplot(3,5,7);
imshow(img_butterfly_2(300:450,300:450,1:end));
xlabel('obraz2 + 1% PSNR: 22.1244');
subplot(3,5,8);
imshow(butterfly_median_3_col(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 11.7986');
subplot(3,5,9);
imshow(butterfly_median_5_col(300:450,300:450,1:end));
xlabel('mediana 5x5 PSNR: 11.9124');
subplot(3,5,10);
imshow(butterfly_median_7_col(300:450,300:450,1:end));
xlabel('mediana 7x7 PSNR: 12.0636');

%% plotting median 
psnr_grey_boat = psnr(img_1_grey(4:end-3),img_boat_grey(4:end-3));
psnr_grey_butterfly = psnr(img_2_grey(4:end-3),img_butterfly_grey(4:end-3));


boat_median_3 = median_filter(img_boat_grey, 3);
psnr_median_boat_1 = psnr(img_1_grey(4:end-3),boat_median_3(4:end-3));

boat_median_5 = median_filter(img_boat_grey, 5);
psnr_median_boat_2 = psnr(img_1_grey(4:end-3),boat_median_5(4:end-3));

boat_median_7 = median_filter(img_boat_grey, 7);
psnr_median_boat_3 = psnr(img_1_grey(4:end-3),boat_median_7(4:end-3));

butterfly_median_3 = median_filter(img_butterfly_grey,3);
psnr_median_boat_4 = psnr(img_2_grey(4:end-3),butterfly_median_3(4:end-3));

butterfly_median_5 = median_filter(img_butterfly_grey,5);
psnr_median_boat_5 = psnr(img_2_grey(4:end-3),butterfly_median_5(4:end-3));

butterfly_median_7 = median_filter(img_butterfly_grey,7);
psnr_median_boat_6 = psnr(img_2_grey(4:end-3),butterfly_median_7(4:end-3));

figure;
subplot(3,5,1);
imshow(img_1_grey(300:450,300:450,1:end));
xlabel("obraz1");
subplot(3,5,2);
imshow(img_boat_grey(300:450,300:450,1:end));
xlabel('obraz1 + 3% PSNR: 23.8829');
subplot(3,5,3);
imshow(boat_median_3(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 27.4523');
subplot(3,5,4);
imshow(boat_median_5(300:450,300:450,1:end));
xlabel('mediana 5x5 PSNR: 23.7402');
subplot(3,5,5);
imshow(boat_median_7(300:450,300:450,1:end));
xlabel('mediana 7x7 PSNR: 21.9472');
subplot(3,5,6);
imshow(img_2_grey(300:450,300:450,1:end));
xlabel('obraz2');
subplot(3,5,7);
imshow(img_butterfly_grey_2(300:450,300:450,1:end));
xlabel('obraz2 + 1% PSNR: 25.7416');
subplot(3,5,8);
imshow(butterfly_median_3(300:450,300:450,1:end));
xlabel('mediana 3x3 PSNR: 31/2687');
subplot(3,5,9)
imshow(butterfly_median_5(300:450,300:450,1:end));
xlabel('mediana 5x5 PSNR: 25.5369');
subplot(3,5,10);
imshow(butterfly_median_7(300:450,300:450,1:end));
xlabel('mediana 7x7 PSNR: 22.1279');

%% Plotting LUM

% psnr_img_1_1 = psnr(img_1(4:end-3),img_boat_1(4:end-3));

lum_boat_0 = lum_filter(img_boat_grey,3,0);
% psnr_boat_lum_1 = psnr(img_1(4:end-3),lum_boat_0(4:end-3));

lum_boat_1 = lum_filter(img_boat_grey,3,1);
% psnr_boat_lum_2 = psnr(img_1(4:end-3),lum_boat_1(4:end-3));

lum_boat_2 = lum_filter(img_boat_grey,3,2);
% psnr_boat_lum_3 = psnr(img_1(4:end-3),lum_boat_2(4:end-3));

lum_boat_3 = lum_filter(img_boat_grey,3,3);
% psnr_boat_lum_4 = psnr(img_1(4:end-3),lum_boat_3(4:end-3));

lum_boat_4 = lum_filter(img_boat_grey,3,4);
% psnr_boat_lum_5 = psnr(img_1(4:end-3),lum_boat_4(4:end-3));

lum_boat_5 = lum_filter(img_boat_grey,5,1);
% psnr_boat_lum_6 = psnr(img_1(4:end-3),lum_boat_5(4:end-3));


figure;
subplot(3,4,1);
imshow(img_1_grey(300:450,300:450,1:end));
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_boat_grey_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.2308');
subplot(3,4,3);
imshow(lum_boat_0(300:450,300:450,1:end));
xlabel('LUM 3x3 k=0 PSNR: 27.5329');
subplot(3,4,4);
imshow(lum_boat_1(300:450,300:450,1:end));
xlabel('LUM 3x3 k=1 PSNR: 30.3875');
subplot(3,4,5);
imshow(lum_boat_2(300:450,300:450,1:end));
xlabel('LUM 3x3 k=2 PSNR: 32:3391');
subplot(3,4,6);
imshow(lum_boat_3(300:450,300:450,1:end));
xlabel('LUM 3x3 k=3 PSNR: 28.2985');
subplot(3,4,7);
imshow(lum_boat_4(300:450,300:450,1:end));
xlabel('LUM 3x3 k=4 PSNR: 20.2766');
subplot(3,4,8);
imshow(lum_boat_5(300:450,300:450,1:end));
xlabel('LUM 5x5 k=1 PSNR: 24.8672');
% img_2_grey = img_1_grey;
% psnr_img_2_1 = psnr(img_2_grey(4:end-3),img_butterfly_grey(4:end-3));
img_boat = img_butterfly_grey;

lum_boat_0 = lum_filter(img_boat,3,0);
% psnr_boat_lum_1 = psnr(img_2_grey(4:end-3),lum_boat_0(4:end-3));

lum_boat_1 = lum_filter(img_boat,3,1);
% psnr_boat_lum_2 = psnr(img_2_grey(4:end-3),lum_boat_1(4:end-3));

lum_boat_2 = lum_filter(img_boat,3,2);
% psnr_boat_lum_3 = psnr(img_2_grey(4:end-3),lum_boat_2(4:end-3));

lum_boat_3 = lum_filter(img_boat,3,3);
% psnr_boat_lum_4 = psnr(img_2_grey(4:end-3),lum_boat_3(4:end-3));

lum_boat_4 = lum_filter(img_boat,3,4);
% psnr_boat_lum_5 = psnr(img_2_grey(4:end-3),lum_boat_4(4:end-3));

lum_boat_5 = lum_filter(img_boat,5,1);
% psnr_boat_lum_6 = psnr(img_2_grey(4:end-3),lum_boat_5(4:end-3));
figure;
subplot(3,4,1);
imshow(img_2_grey(300:450,300:450,1:end));
xlabel("obraz 1");
subplot(3,4,2);
imshow(img_butterfly_grey_1(300:450,300:450,1:end));
xlabel('obraz1 + 1% PSNR: 25.7416');
subplot(3,4,3);
imshow(lum_boat_0(300:450,300:450,1:end));
xlabel('LUM 3x3 k=0 PSNR: 31.1652');
subplot(3,4,4);
imshow(lum_boat_1(300:450,300:450,1:end));
xlabel('LUM 3x3 k=1 PSNR: 34.6402');
subplot(3,4,5);
imshow(lum_boat_2(300:450,300:450,1:end));
xlabel('LUM 3x3 k=2 PSNR: 35.7389');
subplot(3,4,6);
imshow(lum_boat_3(300:450,300:450,1:end));
xlabel('LUM 3x3 k=3 PSNR: 32.6845');
subplot(3,4,7);
imshow(lum_boat_4(300:450,300:450,1:end));    
xlabel('LUM 3x3 k=4 PSNR: 25.7415');
subplot(3,4,8);
imshow(lum_boat_5(300:450,300:450,1:end));
xlabel('LUM 5x5 k=1 PSNR: 27.4367');



%% img prep
function blank_img = img_prep(img, window_size)
    [X,Y,DIM] = size(img);
    add_size = (window_size+1)/2-1;
    blank_img = zeros(X+2*add_size,Y+2*add_size);
    for k=1:1:DIM
        for i=1+add_size:1:X+add_size
            for j=1+add_size:1:Y+add_size
               blank_img(i,j,k) = double(img(i-add_size,j-add_size,k));
            end
        end
    end
    
    for k=1:1:DIM
        blank_img(1:add_size,1:add_size,k) = img(1,1,k);
        blank_img(1:add_size,end-add_size:end,k) = img(1,end,k);
        blank_img(end-add_size:end,1:add_size,k) = img(end,1,k);
        blank_img(end-add_size:end,end-add_size:end,k) = img(end,end,k);
%         if window_size == 3
%             blank_img(1:add_size,add_size+add_size:end-window_size-window_size+1) = img(1:add_size,add_size:end);
%         elseif window_size == 5
%             blank_img(1:add_size,add_size+add_size:end-window_size-window_size) = img(1:add_size,add_size:end);
%         end
    end

    blank_img = uint8(blank_img);

end
%% Functions

function result_img = median_filter (img, window_size)
    [X,Y,DIM] = size(img);
    result_img = zeros(X,Y,DIM);
    if rem(window_size,2) == 0
        return;
    end
    spectrum = (window_size-1)/2;
    img = img_prep(img,window_size);
    
    for k=1:1:DIM
        for i=1+spectrum:1:X+1
            for j=1+spectrum:1:Y+1
                median_window = img(i-spectrum:i+spectrum,j-spectrum:j+spectrum,k);            
                img(i,j,k) = median(median_window,'all');
    
            end
        end
    end
    for k=1:1:DIM
        result_img(1:end,1:end,k) = double(img(spectrum+1:end-spectrum,spectrum+1:end-spectrum,k));
    end
    result_img = uint8(result_img);
end

function result_img = lum_filter (img, window_size,k_param)
    [X,Y,DIM] = size(img);
    result_img = zeros(X,Y,DIM);
    if rem(window_size,2) == 0
        return;
    end
    spectrum = (window_size-1)/2;
    img = img_prep(img,window_size);
    for k=1:1:DIM
        for i=1+spectrum:1:X-spectrum
            for j=1+spectrum:1:Y-spectrum
                median_window = img(i-spectrum:i+spectrum,j-spectrum:j+spectrum,k);
                median_array = sort(reshape(median_window.',1,[]));
                ar_size = (size(median_array,2)+1)/2;
                img(i,j,k) = median([median_array(ar_size-k_param),img(i,j,k),median_array(ar_size+k_param)]);
            end
        end
    end
    for k=1:1:DIM
        result_img(1:end,1:end,k) = double(img(spectrum+1:end-spectrum,spectrum+1:end-spectrum,k));
    end
    result_img = uint8(result_img);
end

function result_img = vmf_filter(img,window_size)
    [X,Y,DIM] = size(img);
    result_img = zeros(X,Y,DIM);
    if rem(window_size,2) == 0
        return;
    end
    spectrum = (window_size-1)/2;
    img = img_prep(img,window_size);
%     for k=1:1:DIM
        for i=1+spectrum:1:X-spectrum
            for j=1+spectrum:1:Y-spectrum
                median_window_R = img(i-spectrum:i+spectrum,j-spectrum:j+spectrum,1);
                median_window_G = img(i-spectrum:i+spectrum,j-spectrum:j+spectrum,2);
                median_window_B = img(i-spectrum:i+spectrum,j-spectrum:j+spectrum,3);
                [pixel_result_R,pixel_result_B,pixel_result_G] = vmf_sort(median_window_R,median_window_G,median_window_B);
                img(i,j,1) = pixel_result_R;
                img(i,j,2) = pixel_result_G;
                img(i,j,3) = pixel_result_B;

            end
        end
%     end
    for k=1:1:DIM
        result_img(1:end,1:end,k) = double(img(spectrum+1:end-spectrum,spectrum+1:end-spectrum,k));
    end
    result_img = uint8(result_img);
end

%% Sub functions

function [pixel_result_R,pixel_result_B,pixel_result_G] = vmf_sort(matrix_R,matrix_G,matrix_B)
    [X,Y,DIM] = size(matrix_R);
    matrix_R = reshape(matrix_R.',1,[]);
    matrix_G = reshape(matrix_G.',1,[]);
    matrix_B = reshape(matrix_B.',1,[]);
%     disp(matrix_R);
    vmf_vec = zeros(X*Y,1);
%     disp(vmf_vec);
    for k=1:1:X*Y
        for i=1:1:X*Y
            vmf_vec(k) = vmf_vec(k) + sum([abs(matrix_R(k)-matrix_R(i)),abs(matrix_G(k)-matrix_G(i)),abs(matrix_B(k)-matrix_B(i))]);
        end
    end
%     vmf_vec = sort(vmf_vec);
    [y, result_pos] = min(abs(vmf_vec-median(vmf_vec))); 
    pixel_result_R = matrix_R(result_pos);
    pixel_result_G = matrix_G(result_pos);
    pixel_result_B = matrix_B(result_pos);
end

