hexclc
clear 
%%
% [file,path]=uigetfile('*.*', 'Select an image');
% img = imread([path, file]);


folders_name = ["hex","key","nakretka"];
plotting(folders_name)

%% Functions

function plotting(folder_name)
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
        end

   end
    figure(1);
    plot(factor_1_c,factor_2_c,"r*");
    hold on
    plot(factor_1_r,factor_2_r,"g*");
    plot(factor_1_t,factor_2_t,"b*");
    ylabel("compact");
    xlabel("malinowska");
    legend("hex","key","nakretka");

    figure(2)
    plot(factor_3_c,factor_1_c,"r*");
    hold on
    plot(factor_3_r,factor_1_r,"g*");
    plot(factor_3_t,factor_1_t,"b*");

    legend("hex","key","nakretka");
    xlabel("mz");
    ylabel("compact");

    figure(3);
    plot(factor_2_c,factor_3_c,"r*");
    hold on
    plot(factor_2_r,factor_3_r,"g*");
    plot(factor_2_t,factor_3_t,"b*");
    ylabel("malinowska");
    xlabel("mz");
    legend("hex","key","nakretka");

    figure(4);
    plot3(factor_1_c,factor_2_c,factor_3_c,"r*");
    hold on
    plot3(factor_1_r,factor_2_r,factor_3_r,"g*");
    plot3(factor_1_t,factor_2_t,factor_3_t,"b*");
    ylabel("malinowska");
    xlabel("compact");
    zlabel("mz");
    legend("hex","key","nakretka");
    exportgraphics(figure(1),"2D_1.eps");
    exportgraphics(figure(2),"2D_2.eps");
    exportgraphics(figure(3),"2D_3.eps");
    exportgraphics(figure(4),"3D.eps");
end









