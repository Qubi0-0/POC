clc
clear
%%
[file,path]=uigetfile('*.*', 'Select an image');
img_1 = imread([path, file]);

[~,~,DIM] = size(img_1);
if DIM > 1
    img_1 = rgb2gray(img_1);
end
img_1 = imresize(img_1,[512,512],"bicubic");


[file,path]=uigetfile('*.*', 'Select an image');
img_2 = imread([path, file]);
[~,~,DIM] = size(img_2);
if DIM > 1
    img_2 = rgb2gray(img_2);
end
img_2 = imresize(img_2,[512,512],"bicubic");


[file,path]=uigetfile('*.*', 'Select an image');
img_3 = imread([path, file]);
[~,~,DIM] = size(img_3);
if DIM > 1
    img_3 = rgb2gray(img_3);
end
img_3 = imresize(img_3,[512,512],"bicubic");

% zdj_1 = "circle";
% zdj_2 = "triangle";
% zdj_3 = "rectangle";
zdj_1 = "hex";
zdj_2 = "key";
zdj_3 = "nakretka";


figure(1);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"rotate","compact");
subplot(3,3,1);
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K1 - rotacja");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,2);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"scale","compact");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K1 - zmiana skali");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,3);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"translate","compact");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K1 - translacja");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,4);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"rotate","malinowska");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K2 - zmiana rotacja");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,5);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"scale","malinowska");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K2 - zmiana skali");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,6);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"translate","malinowska");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K2 - translacja");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,7);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"rotate","mz");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K3 - zmiana rotacja");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,8);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"scale","mz");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K3 - zmiana skala");
legend(zdj_1,zdj_2,zdj_3);

subplot(3,3,9);
[k1,k2,k3,X] = plotter(img_1,img_2,img_3,"translate","mz");
hold on;
plot(X,k1);
plot(X,k2);
plot(X,k3);
xlabel("K3 - translacja");
legend(zdj_1,zdj_2,zdj_3);


exportgraphics(figure(1),"zad3.eps");
%% Functions



function [factor_1,factor_2,factor_3,mode_iterator] = plotter(img_1,img_2,img_3,mode,factor)
    factor_1 = [];
    factor_2 = [];
    factor_3 = [];
    switch mode
        case "rotate"
            mode_iterator = 1:180;
            X = 180;
        case "translate" 
            mode_iterator = 1:16;
            X = 16;
        case "scale"
            mode_iterator = 1:16;
            X = 16;
    end
    for i=1:1:X
        disp(i);
        switch mode
            case "rotate"
                changed_img_1 = imrotate(img_1,i);
                changed_img_2 = imrotate(img_2,i);
                changed_img_3 = imrotate(img_3,i);
            case "translate" 
                changed_img_1 = imtranslate(img_1,[i, i],'FillValues',0);
                changed_img_2 = imtranslate(img_2,[i, i],'FillValues',0);
                changed_img_3 = imtranslate(img_3,[i, i],'FillValues',0);
            case "scale"
                size_factor = 1+i*0.1;
                changed_img_1 = crop_img(img_1,size_factor);
                changed_img_2 = crop_img(img_2,size_factor);
                changed_img_3 = crop_img(img_3,size_factor);
%                 changed_img_1 = imresize(img_1,0.1*i);
%                 changed_img_2 = imresize(img_2,0.1*i);
%                 changed_img_3 = imresize(img_3,0.1*i);
        end
        k1 = count_factors(changed_img_1,factor);
        k2 = count_factors(changed_img_2,factor);
        k3 = count_factors(changed_img_3,factor);
        factor_1 = [factor_1 k1];
        factor_2 = [factor_2 k2];
        factor_3 = [factor_3 k3];
    end
    disp("done");
end 