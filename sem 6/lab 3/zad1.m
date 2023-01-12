
clc
clear
%%
[file,path]=uigetfile('*.*', 'Select an image');
img = imread([path, file]);
img = rgb2gray(img);
% img_2 = imread("zdj\moje.jpg");
% figure(1);
% subplot(1,2,1);
% imshow(img);
% subplot(1,2,2);
% imshow(img_2);
% exportgraphics(figure(1),"oryginał.eps");
% img = rgb2gray(img);
plotter(img,105);

%% Functions

function plotter(img,treshold)
    figure(1);
    subplot(2,3,1);
    imshow(img);
    xlabel("oryginał");

    subplot(2,3,2);
    img_1 = bwlabel(binarize(img,treshold));
%     img_1 = ~img_1;
    imshow(img_1);
    xlabel(append("Własny próg: ",sprintf("%d",treshold)));

    subplot(2,3,3);
    img_2 = bwlabel(binarize(img,-1)); % -1 used to trigger OTSU
%     img_2 = ~img_2;
    imshow(img_2);
    xlabel(append("OTSU próg: ",sprintf("%d",graythresh(img)*255)));
    subplot(2,3,4);
    imhist(img);

    subplot(2,3,5);
    imshow(label2rgb(img_1));
    label_info = append("Ilość obszarów: ",sprintf("%d",max(bwlabel(img_1),[],'all')));
    xlabel(label_info);

    subplot(2,3,6);
    imshow(label2rgb(img_2));
    label_info = append("Ilość obszarów: ",sprintf("%d",max(bwlabel(img_2),[],'all')));
    xlabel(label_info);
%     exportgraphics(figure(1),"zad1_2.eps");
end


