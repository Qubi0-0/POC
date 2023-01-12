clc
clear 
%%
% [file,path]=uigetfile('*.*', 'Select an image');
% img = imread([path, file]);


folder_name = ["hex","key","nakretka"];

figure;
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
    [circle,rectangle,triangle] = knn_test_factors();

end

figure(1);
plot(factor_1_c,factor_2_c,"r*");
hold on
plot(factor_1_r,factor_2_r,"g*");
plot(factor_1_t,factor_2_t,"b*");
plot(circle{1}{1},circle{1}{2},"rdiamond");
plot(circle{2}{1},circle{2}{2},"rdiamond"); 
plot(rectangle{1}{1},rectangle{1}{2},"gdiamond");
plot(rectangle{2}{1},rectangle{2}{2},"gdiamond");
plot(triangle{1}{1},triangle{1}{2},"bdiamond");
plot(triangle{2}{1},triangle{2}{2},"bdiamond");
ylabel("compact");
xlabel("malinowska");
legend("hex","key","nakretka","hex test","hex test 2", ...        
    "key test","key test 2","nakretka test","nakretka test 2");


figure(2);
plot(factor_3_c,factor_1_c,"r*");
hold on
plot(factor_3_r,factor_1_r,"g*");
plot(factor_3_t,factor_1_t,"b*");
plot(circle{1}{3},circle{1}{1},"rdiamond");
plot(circle{2}{3},circle{2}{1},"rdiamond"); 
plot(rectangle{1}{3},rectangle{1}{1},"gdiamond");
plot(rectangle{2}{3},rectangle{2}{1},"gdiamond");
plot(triangle{1}{3},triangle{1}{1},"bdiamond");
plot(triangle{2}{3},triangle{2}{1},"bdiamond");
legend("hex","key","nakretka","hex test","hex test 2", ...       
    "key test","key test 2","nakretka test","nakretka test 2");

xlabel("mz");
ylabel("compact");

figure(3);
plot(factor_2_c,factor_3_c,"r*");
hold on
plot(factor_2_r,factor_3_r,"g*");
plot(factor_2_t,factor_3_t,"b*");
plot(circle{1}{2},circle{1}{3},"diamond");
plot(circle{2}{2},circle{2}{3},"diamond"); 
plot(rectangle{1}{2},rectangle{1}{3},"diamond");
plot(rectangle{2}{2},rectangle{2}{3},"diamond");
plot(triangle{1}{2},triangle{1}{3},"diamond");
plot(triangle{2}{2},triangle{2}{3},"diamond");
ylabel("malinowska");
xlabel("mz");
legend("circle","rectangle","triangle","circle test","circle test 2", ...
    "rectangle test","rectangle test 2","triangle test","triangle test 2");
exportgraphics(figure(1),"knn_1.eps");
exportgraphics(figure(2),"knn_2.eps");
exportgraphics(figure(3),"knn_3.eps");

% figure;
% plot3(factor_1_c,factor_2_c,factor_3_c,"r*");
% hold on
% plot3(factor_1_r,factor_2_r,factor_3_r,"g*");
% plot3(factor_1_t,factor_2_t,factor_3_t,"b*");
% ylabel("malinowska");
% xlabel("compact");
% zlabel("mz");
% legend("circle","rectangle","triangle");









