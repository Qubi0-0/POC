clc 
clear 

%%
[file,path]=uigetfile('*.*', 'Select an image');
img = imread([path, file]);
img = rgb2gray(img);

plotting(img);

%% functions

function plotting(img)
   figure(1);
   k = 1;
   label_info = "Oryginał";
   subplot(3,5,1);
   imshow(img);
   xlabel(label_info);
%    size_var_x = 600:2000;
%    size_var_y = 1100:2500;

   size_var_x = 1100:2500;
   size_var_y = 1100:2500;
   for i=1:1:2
        for j=1:1:5
                switch j
                    case 1 
                        if i==1
                            result_img = binarize(img,85);
                            bin_img = result_img;
                            subplot(3,5,j+5);
                            imshow(result_img(size_var_x,size_var_y));
                            label_info = append("Próg :",sprintf("%d",85));
                        else 
                            result_img_1 = label2rgb(bwlabel(result_img));
                            subplot(3,5,j+10);
                            imshow(result_img_1(size_var_x,size_var_y,:));
                            label_info = append("obszary:",sprintf("%d",max(bwlabel(bin_img),[],'all')));
                        end
                    case 2
                        if i==1
                            r = 8;
                            se =  strel("disk",r);
                            result_img = imerode(result_img,se);
                            erode_img = result_img;
                            subplot(3,5,j+5);
                            imshow(result_img(size_var_x,size_var_y));
                            label_info = append("erozja dysk R = ",sprintf("%d",r));
                        else 
                            result_img_1 = label2rgb(bwlabel(imerode(result_img,se)));
                            subplot(3,5,j+10);
                            imshow(result_img_1(size_var_x,size_var_y,:));imshow(result_img_1(size_var_x,size_var_y,:))
                            label_info = append("obszary:",sprintf("%d",max(bwlabel(erode_img),[],'all')));
                        end
                    case 3
                        if i==1
                            r = 9;
                            se = strel("octagon",r);
                            result_img = imdilate(result_img,se);
                            dilate_img = result_img;
                            subplot(3,5,j+5);
                            imshow(result_img(size_var_x,size_var_y));
                            label_info = append("dylatacja oktagon R = ",sprintf("%d",r));
                        else 
                            result_img_1 = label2rgb(bwlabel(imdilate(result_img,se)));
                            subplot(3,5,j+10);
                            imshow(result_img_1(size_var_x,size_var_y,:));
                            label_info = append("obszary:",sprintf("%d",max(bwlabel(dilate_img),[],'all')));
                        end
                    case 4
                        if i==1
                            r = 8;
                            se = strel('line',r,r);
                            result_img = imopen(result_img,se);
                            open_img = result_img;
                            subplot(3,5,j+5);
                            imshow(result_img(size_var_x,size_var_y));
                            label_info = append("Dylatacja kwadrat R = ",sprintf("%d",r));
                        else 
                            result_img_1 = label2rgb(bwlabel(imopen(result_img,se)));
                            subplot(3,5,j+10);
                            imshow(result_img_1(size_var_x,size_var_y,:));
                            label_info = append("obszary:",sprintf("%d",max(bwlabel(open_img),[],'all')));
                        end  
                    case 5
                        if i==1
                            r =8;
                            se = strel('disk',r);
                            result_img = imclose(result_img,se);
                            close_img = result_img;
                            subplot(3,5,j+5);
                            imshow(result_img(size_var_x,size_var_y));
                            label_info = append("Zamykanie dysk R = ",sprintf("%d",r));
                        else 
                            result_img_1 = label2rgb(bwlabel(imclose(result_img,se)));
                            subplot(3,5,j+10);
                            imshow(result_img_1(size_var_x,size_var_y,:));
                            label_info = append("obszary:",sprintf("%d",max(bwlabel(close_img),[],'all')));
                        end
                end
                xlabel(label_info);
                exportgraphics(figure(1),"zad3_2.eps")
        end
   end
end