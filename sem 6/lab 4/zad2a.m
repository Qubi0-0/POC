    clc;
    clear;
%% 
folder_name = ["hex","key","nakretka"];

k= 1;
   figure(1);
   factor_1_c = [];
   factor_1_r = [];
   factor_1_t = [];   
   factor_2_c = [];
   factor_2_r = [];
   factor_2_t = [];
   factor_3_c = [];
   factor_3_r = [];
   factor_3_t = [];
   for i=1:1:3
        for j=1:1:5
            file_name = append(folder_name(i),'/','1_',sprintf("%d",j-1),'.png');
            image_data = imread(file_name);
            [~,~,DIM] = size(image_data);
            if DIM > 1
                image_data = rgb2gray(image_data);

            end
                subplot(3,5,k);
                imshow(image_data);
                k = k + 1;
            switch i
                case 1 %circle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_c = [factor_1_c k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_c = [factor_2_c k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_c = [factor_3_c k3];
                case 2 %rectangle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_r = [factor_1_r k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_r = [factor_2_r k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_r = [factor_3_r k3];

                case 3 %triangle
                    image_data = imresize(image_data,[512,512],"bicubic");
                    k1 = count_factors(image_data,"compact");
                    factor_1_t = [factor_1_t k1];
                    k2 = count_factors(image_data,"malinowska");
                    factor_2_t = [factor_2_t k2];
                    k3 = count_factors(image_data,"mz");
                    factor_3_t = [factor_3_t k3];
            end
        xlabel(sprintf("k1 : %0.3f \n k2 : %0.3f \n k3: %0.3f",k1 ,k2,k3));
        end


   end
   exportgraphics(figure(1),"zad2a.eps");